import Foundation

extension Encodable {
    func encodeToData() -> Data? {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return try? encoder.encode(self)
    }

    var dictionary: [String: Any]? {
        guard let data = self.encodeToData() else { return nil }
        let any = try? JSONSerialization.jsonObject(with: data, options: [])
        return any as? [String: Any]
    }
}
