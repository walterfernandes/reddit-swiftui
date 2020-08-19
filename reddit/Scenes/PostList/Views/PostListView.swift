import SwiftUI

struct PostListView: View {
    @ObservedObject var presenter: PostListPresenter

    init(presenter: PostListPresenter) {
        self.presenter = presenter
    }

    var body: some View {
        NavigationView {
            view(for: presenter.state)
            .navigationBarTitle(Text("r/programming"))
        }.onAppear {
            self.presenter.loadData()
        }
    }

    private func view(for state: ViewState<[Post]>) ->  some View {
        switch state {
        case let .ready(data):
            return AnyView(
                PostListContentView(postList: data, hitTop: {
                    self.presenter.loadPreviousData(data.first?.data.name ?? "")
                }, hitBottom: {
                    self.presenter.loadNextData((data.last?.data.name ?? ""))
                })
            )
        case .error:
            return AnyView(ErrorView {
                self.presenter.loadData()
            })
        case .loading:
            return AnyView(LoadingView())
        default:
            return AnyView(Text(""))
        }
    }

    private func postDetailView(with postId: String) -> PostDetailView {
        PostDetailView(presenter: PostDetailPresenter(postId: postId))
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        PostListView(presenter: PostListPresenter())
    }
}
