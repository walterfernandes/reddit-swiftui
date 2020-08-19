import Foundation

struct Post: Codable, Equatable, Identifiable {
    var id: String { data.id }

    var kind: Type
    var data: Data

    enum `Type`: String, Codable {
        case comment = "t1"
        case link = "t3"
        case more = "more"

        public init(from decoder: Decoder) throws {
            self = try `Type`(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .more
        }
    }

    struct Data: Codable, Equatable {
        var id: String
        var name: String
        var createdUtc: Date?
        var score: Int?
        var title: String?
        var author: String?
        var url: String?
        var body: String?
        var replies: Listing?
        var numComments: Int?

        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: Data.CodingKeys.self)
            self.id = try container.decode(String.self, forKey: .id)
            self.name = try container.decode(String.self, forKey: .name)
            self.createdUtc = try? container.decode(Date.self, forKey: .createdUtc)
            self.score = try? container.decode(Int.self, forKey: .score)
            self.title = try? container.decode(String.self, forKey: .title)
            self.author = try? container.decode(String.self, forKey: .author)
            self.url = try? container.decode(String.self, forKey: .url)
            self.body = try? container.decode(String.self, forKey: .body)
            self.replies = try? container.decode(Listing.self, forKey: .replies)
            self.numComments = try? container.decode(Int.self, forKey: .numComments)
        }
    }
}
