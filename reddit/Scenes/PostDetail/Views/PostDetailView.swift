import SwiftUI

struct PostDetailView: View {
    @ObservedObject var presenter: PostDetailPresenter
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var backButton : some View {
        Button(action: backView) {
            Image.backIcon.foregroundColor(Color.black)
        }
    }

    var body: some View {
        view(for: presenter.state).onAppear {
            self.presenter.loadData()
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }

    private func view(for state: ViewState<[Post]>) -> AnyView {
        switch state {
        case let .ready(data):
            return AnyView(PostDetailContentView(postList: data))
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

    private func backView() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(presenter: PostDetailPresenter(postId: "any"))
    }
}
