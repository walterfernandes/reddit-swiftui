struct Listing: Codable, Equatable {
    var kind: String
    var data: Data

    struct Data: Codable, Equatable {
        var modhash: String
        var dist: Int?
        var after: String?
        var before: String?
        var children: [Post]
    }
}
