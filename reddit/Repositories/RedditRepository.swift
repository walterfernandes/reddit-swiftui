import Foundation

class RedditRepository {

    private var network: NetworkProtocol

    init(network: NetworkProtocol = Network.sharedInstance) {
        self.network = network
    }
}

extension RedditRepository: RedditRepositoryType {
    func getProgrammingPosts(pagination: Pagination?, completion: @escaping (Result<Listing, Error>) -> Void) {
        network.request(RedditService.programming(pagination: pagination), completion: completion)
    }

    func getPostDetail(id: String, completion: @escaping (Result<[Listing], Error>) -> Void) {
        network.request(RedditService.postDetails(id: id), completion: completion)
    }
}
