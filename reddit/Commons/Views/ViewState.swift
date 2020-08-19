enum ViewState<T: Equatable>: Equatable {
    case empty
    case loading
    case error
    case ready(data: T)
}
