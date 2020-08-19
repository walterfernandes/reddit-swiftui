import Foundation

import Quick
import Nimble

@testable import Reddit

class DateExtTests: QuickSpec {
    override func spec() {

        var sut: Date!

        beforeEach {
            sut = Date(timeIntervalSince1970: 1480134638.0)
        }

        describe("#string") {
            it("shuld return a formated date string") {
                expect(sut.string()).to(equal("26/11 02h"))
            }
        }
    }
}
