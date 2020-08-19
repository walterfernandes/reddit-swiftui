import SwiftUI

struct PostCommentView: View {
    var post: Post
    var hierarchy: Int = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("u/\(post.data.author ?? "") • \(post.data.createdUtc?.string() ?? "")")
                .font(.caption)
                .foregroundColor(Color.gray)
            Text(post.data.body ?? "")
                .font(.comment)
            HStack {
                Spacer()
                Image.upIcon
                Text("\(post.data.score ?? 0)")
                    .font(Font.bottom)
                    .foregroundColor(Color.gray)
                Image.downIcon
            }
        }
        .padding(.leading, 20 * CGFloat(hierarchy))
    }
}

struct PostCommentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostCommentView(post: Post.commentMock()!)
            PostCommentView(post: Post.commentMock()!, hierarchy: 1)
        }.previewLayout(.fixed(width: 320, height: 320))
    }
}
