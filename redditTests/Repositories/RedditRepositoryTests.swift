import Quick
import Nimble
import Cuckoo

@testable import Reddit

class RedditRepositoryTests: QuickSpec {

    override func spec() {
        var sut: RedditRepository!
        var network: MockNetworkProtocol!

        beforeEach {
            network = MockNetworkProtocol()
            sut = RedditRepository(network: network)

            stub(network) {
                $0.request(any(), completion: anyClosure()).thenDoNothing()
            }
        }

        describe("#getProgrammingPosts") {
            it("should call network's request") {
                let argumentCaptor = ArgumentCaptor<Service>()
                sut.getProgrammingPosts(pagination: nil, completion: { _ in })

                verify(network).request(argumentCaptor.capture(), completion: anyClosure())
                expect(argumentCaptor.value?.path).to(equal(RedditService.programming(pagination: nil).path))
            }
        }

        describe("#getPostDetail") {
            it("should call network's request") {
                let argumentCaptor = ArgumentCaptor<Service>()
                sut.getPostDetail(id: "anyId", completion: { _ in })

                verify(network).request(argumentCaptor.capture(), completion: anyClosure())
                expect(argumentCaptor.value?.path).to(equal(RedditService.postDetails(id: "anyId").path))
            }
        }
    }
}
