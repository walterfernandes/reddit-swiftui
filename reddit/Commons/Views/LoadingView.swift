import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ActivityIndicator(isAnimating: .constant(true), style: .large)
            Text("Loading...")
                .font(.loading)
                .foregroundColor(Color.gray)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
