import SwiftUI

struct PostListContentView: View {
    var postList: [Post]
    var hitTop: () -> Void
    var hitBottom: () -> Void

    var body: some View {
        List(postList) { post in
            NavigationLink(destination: self.postDetailView(with: post.id)) {
                PostListRow(post: post).onAppear {
                    if post == self.postList.first {
                        self.hitTop()
                    } else if post == self.postList.last {
                        self.hitBottom()
                    }
                }
            }
        }
    }

    private func postDetailView(with postId: String) -> PostDetailView {
        PostDetailView(presenter: PostDetailPresenter(postId: postId))
    }
}

struct PostListContentView_Previews: PreviewProvider {
    static var previews: some View {
        PostListContentView(postList: Listing.mock()!.data.children, hitTop: { }, hitBottom: { })
    }
}
