extension Post: Mockable {
    static func commentMock() -> Self? {
        mock(for: "Comment")
    }
}
