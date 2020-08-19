//swiftlint:disable function_body_length discouraged_direct_init
import Quick
import Nimble
import Cuckoo
import OHHTTPStubs

@testable import Reddit

struct RequestResponse: Codable {
    var status: String
}

class NetworkTests: QuickSpec {
    override func spec() {

        var sut: Network!
        var service: MockService!
        var logger: MockNetworkLoggerProtocol!

        beforeEach {
            logger = MockNetworkLoggerProtocol()
            service = MockService()
            sut = Network.init(logger: logger)

            stub(logger) {
                $0.failure(service: any()).thenDoNothing()
                $0.request(any(), service: any()).thenDoNothing()
                $0.response(any(), data: any(), service: any()).thenDoNothing()
            }

            stub(service) {
                $0.headers.get.thenReturn(["CustomHeader": "CustomValue"])
                $0.method.get.thenReturn(.get)
                $0.params.get.thenReturn(nil)
                $0.queryParams.get.thenReturn(["param": "any"])
                $0.path.get.thenReturn("/test")
            }
        }

        describe("#request") {

            context("when complete with success") {
                var requestResponse: RequestResponse!

                beforeEach {
                    let jsonData = "{\"status\": \"success\"}".data(using: .utf8)!
                    stub(condition: pathEndsWith("test")) { _ in
                        return HTTPStubsResponse(data: jsonData, statusCode: 200, headers: nil)
                    }

                    waitUntil { done in
                        let completion: (Result<RequestResponse, Error>) -> Void = { result in
                            if case .success(let response) = result {
                                requestResponse = response
                            }
                            done()
                        }
                        sut.request(service, completion: completion)
                    }
                }

                it("shold parse data with success") {
                    expect(requestResponse.status).to(equal("success"))
                }
                it("shold call logger request") {
                    let argumentCaptor = ArgumentCaptor<URLRequest>()
                    verify(logger).request(argumentCaptor.capture(), service: any())
                }
                it("shold call logger response") {
                    verify(logger).response(any(), data: any(), service: any())
                }
            }

            context("when complete with response error") {
                var expectedError: Error!

                beforeEach {
                    stub(condition: pathEndsWith("test")) { _ in
                        return HTTPStubsResponse(data: Data(), statusCode: 404, headers: nil)
                    }

                    waitUntil { done in
                        sut.request(service) { result in
                            if case .failure(let error) = result {
                                expectedError = error
                            }
                            done()
                        }
                    }
                }

                it("shold parse data with success") {
                    expect(expectedError as? ApiError).to(equal(ApiError.responseError(code: 404)))
                }
                it("shold call logger request") {
                    verify(logger).request(any(), service: any())
                }

            }
        }

        describe("#base url") {
            context("when Bundle is valid") {
                it("should get base url") {
                    let url = Network.baseUrl(for: Bundle(for: Network.self))
                    expect(url).toNot(beNil())
                }
            }
            context("when Bundle is invalid") {
                it("should return nil for base url") {
                    let url = Network.baseUrl(for: Bundle())
                    expect(url).to(beNil())
                }
            }
        }
    }
}
