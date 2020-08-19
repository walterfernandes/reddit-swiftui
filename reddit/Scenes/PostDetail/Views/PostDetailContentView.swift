import SwiftUI

struct PostDetailContentView: View {
    var postList: [Post]

    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(postList) {
                    self.postView($0)
                }
            }
        }
    }

    private func postView(_ post: Post) -> AnyView {
        switch post.kind {
        case .link:
            return AnyView(
                VStack(alignment: .leading) {
                    PostListRow(post: post).padding(8)
                    HStack {
                        Text("BEST COMMENTS")
                            .foregroundColor(.gray)
                            .font(.header)
                        Spacer()
                    }
                    .padding(8)
                    .background(Color.silver)
                }
            )
        case .comment:
            return AnyView(
                VStack {
                    getCommentAndRepliesReplies(post)
                        .padding(8)
                    Divider()
                }
            )
        default:
            return AnyView(Text("more..."))
        }
    }

    private func getCommentAndRepliesReplies(_ post: Post) -> AnyView {
        var list: [(post: Post, hierarchy: Int)] = []
        var processingList: [(post: Post, hierarchy: Int)] = []

        processingList.append((post: post, hierarchy: 0))

        while !processingList.isEmpty {
            let processing = processingList.removeFirst()
            list.append(processing)
            if let replies = processing.post.data.replies?.data.children.filter({ $0.kind == .comment }) {
                processingList.append(contentsOf: replies.map({ (post: $0, hierarchy: processing.hierarchy + 1)}))
            }
        }

        return AnyView(
            VStack {
                ForEach(list, id: \.post.id) { data in
                    PostCommentView(post: data.post, hierarchy: data.hierarchy)
                }
            }
        )
    }
}

struct PostDetailContentView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            PostDetailContentView(postList: [Post.mock()!, Post.commentMock()!])
        }
    }
}
