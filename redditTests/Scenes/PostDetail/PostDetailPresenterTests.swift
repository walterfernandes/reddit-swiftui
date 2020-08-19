import Quick
import Nimble
import Cuckoo

@testable import Reddit

class PostDetailPresenterTests: QuickSpec {
    override func spec() {
        var sut: PostDetailPresenter!
        var repository: MockRedditRepositoryType!

        beforeEach {
            repository = MockRedditRepositoryType()

            sut = PostDetailPresenter(postId: "anyId", repository: repository)
        }

        describe("#init") {
            it("should init with state emtpy") {
                expect(sut.state).to(equal(.empty))
            }
        }

        describe("#loadData") {
            context("when request got success") {
                it("should set state as success") {
                    var response = Listing.detailMock()!

                    stubRepository(with: .success(response))
                    sut.loadData()
                    expect(sut.state).to(equal(.ready(data: response.flatMap({ $0.data.children }))))
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

        func stubRepository(with result: Result<[Listing], Error>) {
            stub(repository) {
                $0.getPostDetail(id: anyString(), completion: anyClosure()).then { _, completion in
                    completion(result)
                }
            }
        }
    }
}
