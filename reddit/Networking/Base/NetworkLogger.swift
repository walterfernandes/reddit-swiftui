import Foundation

public protocol NetworkLoggerProtocol {
    func request(_ request: URLRequest, service: String?)
    func response(_ response: HTTPURLResponse, data: Data?, service: String?)
    func failure(service: String?)
}

struct NetworkLogger: NetworkLoggerProtocol {
    func request(_ request: URLRequest, service: String? = nil) {
        print("🎯 REQUEST")
        print("🛠 Service: \(service ?? "No Service Name")")
        print("⬆️ URL: \(request.url?.absoluteString ?? "Not Found")")
        print("⬆️ Method: \(request.httpMethod ?? "Not Found")")
        print("⬆️ Headers: \(request.allHTTPHeaderFields ?? [:])")
        print("⬆️ Body: \(String(data: request.httpBody ?? Data(), encoding: .utf8) ?? "")\n\n")
    }

    func response(_ response: HTTPURLResponse, data: Data?, service: String? = nil) {
        print("🎯 RESPONSE")
        print("🛠 Service: \(service ?? "No Service Name")")
        print("⬇️ Status Code: \(response.statusCode) \(response.url?.absoluteString ?? "")")
        print("⬇️ Headers: \(response.allHeaderFields as? [String: String] ?? [:])")
        print("⬇️ Body: \(String(data: data ?? Data(), encoding: .utf8) ?? "")\n\n")
    }

    func failure(service: String? = nil) {
        print("🎯 RESPONSE")
        print("🛠 Service: \(service ?? "No Service Name")")
        print("💥 No Response 💥\n")
    }
}
