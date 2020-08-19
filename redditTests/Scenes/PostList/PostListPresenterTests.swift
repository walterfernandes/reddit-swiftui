// swiftlint:disable function_body_length
import Quick
import Nimble
import Cuckoo

@testable import Reddit

class PostListPresenterTests: QuickSpec {
    override func spec() {
        var sut: PostListPresenter!
        var repository: MockRedditRepositoryType!
        var limit: Int = 10

        beforeEach {
            repository = MockRedditRepositoryType()
            sut = PostListPresenter(repository: repository, limit: limit)
        }

        describe("#init") {
            it("should init with state emtpy") {
                expect(sut.state).to(equal(.empty))
            }
        }

        describe("#loadData") {
            context("when request got success") {
                it("should set state as ready") {
                    var response = Listing.mock()!
                    stubRepository(with: .success(response))
                    sut.loadData()
                    expect(sut.state).to(equal(.ready(data: response.data.children)))
                }
            }

            context("when request fail") {
                it("should set state as error") {
                    stubRepository(with: .failure(ApiError.unknow))
                    sut.loadData()
                    expect(sut.state).to(equal(.error))
                }
            }
        }

        describe("#loadNexData") {
            context("when request got apend more then limit") {
                it("should set state as success with limit") {
                    var response = Listing.mock()!
                    stubRepository(with: .success(response))
                    sut.loadNextData("any")
                    if case let .ready(list) = sut.state {
                        let expecteList = Array(response.data.children.suffix(10))
                        expect(list).to(equal(expecteList))
                    } else {
                        fail()
                    }
                }
            }

            context("when request fail") {
                it("should set state as error") {
                    stubRepository(with: .failure(ApiError.unknow))
                    sut.loadNextData("any")
                    expect(sut.state).to(equal(.error))
                }
            }
        }

        describe("#loadPreviousData") {
            context("when request got apend more then limit") {
                it("should set state as success with limit") {
                    var response = Listing.mock()!
                    stubRepository(with: .success(response))
                    sut.loadPreviousData("any")
                    if case let .ready(list) = sut.state {
                        let expecteList = Array(response.data.children.prefix(10))
                        expect(list).to(equal(expecteList))
                    } else {
                        fail()
                    }
                }
            }

            context("when request fail") {
                it("should set state as error") {
                    stubRepository(with: .failure(ApiError.unknow))
                    sut.loadPreviousData("any")
                    expect(sut.state).to(equal(.error))
                }
            }
        }

        func stubRepository(with result: Result<Listing, Error>) {
            stub(repository) {
                $0.getProgrammingPosts(
                    pagination: any(Pagination.self),
                    completion: anyClosure()
                ).then { _, completion in
                    completion(result)
                }
            }
        }
    }
}
