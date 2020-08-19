public enum ApiError: Error, Equatable {
    case invalidUrl
    case noConnection
    case noData
    case simulationDeclined
    case transactionNotAllowed
    case invalidData
    case unknow
    case responseError(code: Int)
}
