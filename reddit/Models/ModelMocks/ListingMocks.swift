extension Listing: Mockable {

    static func detailMock() -> [Self]? {
        mock(for: "Detail")
    }
}
