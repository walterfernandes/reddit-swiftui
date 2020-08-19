import Foundation

protocol Mockable: Decodable {
    static var fileName: String { get }
    static func mock() -> Self?
}

extension Mockable {

    static var fileName: String {
        String(describing: self)
    }

    static func mock() -> Self? {
        mock(for: fileName)
    }

    static func mock<T: Decodable>(for file: String) -> T? {
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
                return nil
        }

        do {
            let data = try Data(contentsOf: url, options: .alwaysMapped)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(T.self, from: data)
            return result
        } catch let error {
            print("Decode error \(error)")
            return nil
        }
    }
}
