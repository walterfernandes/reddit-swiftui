import Foundation

class PostListPresenter: ObservableObject {
    @Published var state: ViewState<[Post]> = .empty

    private var repository: RedditRepositoryType
    private var limit: Int

    private var postList: [Post] = [] {
        didSet {
            state = .ready(data: postList)
        }
    }

    init(repository: RedditRepositoryType = RedditRepository(), limit: Int = 100) {
        self.repository = repository
        self.limit = limit
    }
}

extension PostListPresenter {
    func loadData() {
        state = .loading
        loadData(success: { [weak self] in
            self?.postList = $0.data.children
        })
    }

    func loadNextData(_ after: String) {
        loadData(with: .after(value: after)) { [weak self] in
            guard let self = self else { return }
            var list = self.postList
            list.append(contentsOf: $0.data.children)
            if list.count > self.limit {
                list = Array(list.dropFirst(list.count - self.limit))
            }
            self.postList = list
        }
    }

    func loadPreviousData(_ before: String) {
        loadData(with: .before(value: before)) { [weak self] in
            guard let self = self else { return }
            var list = self.postList
            list.insert(contentsOf: $0.data.children, at: 0)
            if list.count > self.limit {
                list = Array(list.dropLast(list.count - self.limit))
            }
            self.postList = list
        }
    }

    private func loadData(with pagination: Pagination? = nil, success: @escaping (Listing) -> Void) {
        repository.getProgrammingPosts(pagination: pagination) { [weak self] result in
            switch result {
            case let .success(response):
                success(response)
            case .failure:
                self?.state = .error
            }
        }
    }
}
