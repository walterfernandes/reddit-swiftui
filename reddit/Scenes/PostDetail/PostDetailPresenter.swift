import Foundation

class PostDetailPresenter: ObservableObject {
    @Published var state: ViewState<[Post]> = .empty

    private var repository: RedditRepositoryType
    private var postId: String
    private var postList: [Post] = [] {
        didSet {
            state = .ready(data: postList)
        }
    }

    init(postId: String, repository: RedditRepositoryType = RedditRepository()) {
        self.repository = repository
        self.postId = postId
    }
}

extension PostDetailPresenter {
    func loadData() {
        state = .loading
        repository.getPostDetail(id: postId) { [weak self] result in
            switch result {
            case let .success(response):
                self?.state = .ready(data: response.flatMap({ $0.data.children }))
            case .failure:
                self?.state = .error
            }
        }
    }
}
