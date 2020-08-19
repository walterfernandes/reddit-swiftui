import SwiftUI

struct PostListRow: View {
    let post: Post

    @State private var showShareSheet = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("u/\(post.data.author ?? "") • \(post.data.createdUtc?.string() ?? "")")
                .font(.caption)
                .foregroundColor(Color.gray)
            Text(post.data.title ?? "")
                .font(.headline)
            HStack {
                Image.upIcon
                Text("\(post.data.score ?? 0)")
                    .font(Font.bottom)
                    .foregroundColor(Color.gray)
                Image.downIcon
                Spacer()
                Image.commentIcon
                Text("\(post.data.numComments ?? 0)")
                    .font(Font.bottom)
                    .foregroundColor(Color.gray)
                Spacer()
                Button(action: self.shareAction) {
                    HStack {
                    Image.shareIcon
                    Text("share")
                        .font(Font.bottom)
                        .foregroundColor(Color.gray)
                    }
                }.buttonStyle(BorderlessButtonStyle())
            }
        }
        .sheet(isPresented: $showShareSheet) {
            ShareSheetView(activityItems: [self.post.data.title,
                                           self.post.data.url].compactMap({ $0 }))
        }
    }

    private func shareAction() {
        showShareSheet = true
    }
}

struct PostListRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostListRow(post: Post.mock()!)
        }
        .previewLayout(.fixed(width: 320, height: 130))
    }
}
