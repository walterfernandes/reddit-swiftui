import Foundation

enum RedditService: Service {

    case programming(pagination: Pagination?)
    case postDetails(id: String)

    var path: String {
        switch self {
        case .programming:
            return "/r/programming.json"
        case let .postDetails(id):
            return "/r/programming/comments/\(id).json"
        }
    }

    var method: HttpMethod {
        return .get
    }

    var params: Encodable? {
        return nil
    }

    var queryParams: [String: String]? {
        switch self {
        case let .programming(.some(pagination)):
            switch pagination {
            case let .after(value):
                return ["after": value]
            case let .before(value):
                return ["before": value]
            }
        case .programming(.none):
            return nil
        case .postDetails:
            return ["depth": "3",
                    "limit": "100",
                    "sort": "confidence"]
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
