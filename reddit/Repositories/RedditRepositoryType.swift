protocol RedditRepositoryType {
    func getProgrammingPosts(pagination: Pagination?, completion: @escaping (Result<Listing, Error>) -> Void)
    func getPostDetail(id: String, completion: @escaping (Result<[Listing], Error>) -> Void)
}
