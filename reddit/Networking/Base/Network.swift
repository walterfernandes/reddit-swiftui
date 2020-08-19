import Foundation

typealias ApiResult = (Result<Data, Error>) -> Void

protocol NetworkProtocol {
    func request(_ service: Service, completion: ApiResult?)
}

extension NetworkProtocol {
    func request<T: Decodable>(_ service: Service, completion: ((Result<T, Error>) -> Void)?) {

        self.request(service) { result in

            switch result {

            case .failure (let error):
                completion?(.failure(error))

            case .success(let data):
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                decoder.dateDecodingStrategy = .secondsSince1970
                do {
                    let object = try decoder.decode(T.self, from: data)
                    completion?(.success(object))
                } catch let error {
                    print(error)
                    completion?(.failure(ApiError.invalidData))
                }
            }
        }
    }
}

class Network: NetworkProtocol {

    static var sharedInstance: NetworkProtocol = Network()

    private var successCodes: Range<Int> = 200..<299
    private var logger: NetworkLoggerProtocol

    init(logger: NetworkLoggerProtocol = NetworkLogger()) {
        self.logger = logger
    }

    static func baseUrl(for bundle: Bundle? = Bundle.main) -> String? {
        return bundle?.infoDictionary?["SERVICE_BASE_URL"] as? String
    }

    public func request(_ service: Service, completion: ApiResult?) {
        guard let urlRequest = configureUrlRequest(with: service) else {
            completion?(.failure(ApiError.invalidUrl))
            return
        }

        execute(request: urlRequest,
                urlSession: URLSession.shared,
                serviceName: String(describing: type(of: service)),
                completion: completion)
    }

    private func configureUrlRequest(with service: Service, baseUrl: String? = baseUrl()) -> URLRequest? {
        guard let baseUrlString = baseUrl else { return nil }

        let fullUrlString = "\(baseUrlString)\(service.path)"

        var urlComps = URLComponents(string: fullUrlString)

        urlComps?.queryItems = service.queryParams?.map { URLQueryItem(name: $0.key, value: $0.value) }

        guard let url = urlComps?.url else { return nil }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = service.method.rawValue

        let params = service.params?.dictionary ?? [:]

        if !params.isEmpty {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: params, options: .sortedKeys)
        }

        for header in service.headers ?? [:] {
            urlRequest.setValue(header.value, forHTTPHeaderField: header.key)
        }

        return urlRequest
    }

    private func execute(request: URLRequest, urlSession: URLSession,
                         serviceName: String? = nil, completion: ApiResult?) {
        logger.request(request, service: serviceName)

        let dataTask = urlSession.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }

                if let error = error {
                    self.logger.failure(service: serviceName)
                    completion?(.failure(error))
                    return
                }

                guard let response = response as? HTTPURLResponse else {
                    self.logger.failure(service: serviceName)
                    completion?(.failure(ApiError.unknow))
                    return
                }

                self.logger.response(response, data: data, service: serviceName)

                guard self.successCodes.contains(response.statusCode) else {
                    completion?(.failure(ApiError.responseError(code: response.statusCode)))
                    return
                }
                completion?(.success(data ?? Data()))
            }
        }

        DispatchQueue.global().async {
            dataTask.resume()
        }
    }
}
