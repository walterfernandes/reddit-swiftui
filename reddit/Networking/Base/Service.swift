public protocol Service {
    var path: String { get }
    var method: HttpMethod { get }
    var params: Encodable? { get }
    var queryParams: [String: String]? { get }
    var headers: [String: String]? { get }
}
