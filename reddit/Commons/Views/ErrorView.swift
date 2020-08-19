import SwiftUI

struct ErrorView: View {
    var trayAgain: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            Image.errorIcon
            Text("Something wrong happened")
                .foregroundColor(Color.iron)
                .font(.errorFont)
            Button(action: trayAgain) {
                Text("Tray again")
            }
            .padding()
            .padding(.horizontal, 20)
            .foregroundColor(Color.iron)
            .overlay(RoundedRectangle(cornerRadius: 40).stroke(Color.iron, lineWidth: 1))
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(trayAgain: {})
    }
}
