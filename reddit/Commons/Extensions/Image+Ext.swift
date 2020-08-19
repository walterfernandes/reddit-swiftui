import SwiftUI

public extension Image {
    static var upIcon: some View {
        Image("upIcon")
            .resizable()
            .frame(width: 14.0, height: 14.0)
            .foregroundColor(Color.gray)
    }

    static var downIcon: some View {
        Image("downIcon")
            .resizable()
            .frame(width: 14.0, height: 14.0)
            .foregroundColor(Color.gray)
    }

    static var commentIcon: some View {
        Image("commentIcon")
            .resizable()
            .frame(width: 14.0, height: 14.0)
            .foregroundColor(Color.gray)
    }

    static var shareIcon: some View {
        Image("shareIcon")
            .resizable()
            .frame(width: 14.0, height: 14.0)
            .foregroundColor(Color.gray)
    }

    static var backIcon: some View {
        Image("backIcon")
            .aspectRatio(contentMode: .fit)
    }

    static var errorIcon: some View {
        Image("errorIcon")
            .resizable()
            .frame(width: 100.0, height: 100.0)
            .foregroundColor(Color.gray)
    }
}
