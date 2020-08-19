// swiftlint:disable function_body_length
import Quick
import Nimble

@testable import Reddit

class RedditServiceTests: QuickSpec {

    override func spec() {

        var sut: RedditService!

        describe("#programming") {
            context("when have no pagination argument") {
                beforeEach {
                    sut = .programming(pagination: nil)
                }
                it("should return right as path") {
                    expect(sut.path).to(equal("/r/programming.json"))
                }
                it("should return get as method") {
                    expect(sut.method).to(equal(.get))
                }
                it("should return nil as params") {
                    expect(sut.params).to(beNil())
                }
                it("should return nil as queryParams") {
                    expect(sut.queryParams).to(beNil())
                }
                it("should return Contet-Type: application/json as headers") {
                    expect(sut.headers).to(equal(["Content-Type": "application/json"]))
                }
            }

            context("when have pagination argument") {
                beforeEach {
                    sut = .programming(pagination: .after(value: "any"))
                }
                it("should return right path") {
                    expect(sut.path).to(equal("/r/programming.json"))
                }
                it("should return get as method") {
                    expect(sut.method).to(equal(.get))
                }
                it("should return nil as params") {
                    expect(sut.params).to(beNil())
                }
                it("should return nil as queryParams") {
                    expect(sut.queryParams).to(equal(["after": "any"]))
                }
                it("should return Contet-Type: application/json as headers") {
                    expect(sut.headers).to(equal(["Content-Type": "application/json"]))
                }
            }
        }

        describe("#postDetails") {
            beforeEach {
                sut = .postDetails(id: "anyId")
            }
            it("should return right path") {
                expect(sut.path).to(equal("/r/programming/comments/anyId.json"))
            }
            it("should return get as method") {
                expect(sut.method).to(equal(.get))
            }
            it("should return nil as params") {
                expect(sut.params).to(beNil())
            }
            it("should return depth, limit and sort as queryParams") {
                expect(sut.queryParams).to(equal(["depth": "3", "limit": "100", "sort": "confidence"]))
            }
            it("should return Contet-Type: application/json as headers") {
                expect(sut.headers).to(equal(["Content-Type": "application/json"]))
            }
        }

    }
}
