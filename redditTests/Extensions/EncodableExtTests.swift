import Quick
import Nimble

@testable import Reddit

struct EncodableStruct: Encodable {
    var status: String
}

class EncodableExtTests: QuickSpec {
    override func spec() {

        var sut: EncodableStruct!

        beforeEach {
            sut = EncodableStruct(status: "success")
        }

        describe("#dictionary") {
            it("shuld return a right dictionary") {
                expect(sut.dictionary!["status"] as? String).to(equal("success"))
            }
        }
    }
}
