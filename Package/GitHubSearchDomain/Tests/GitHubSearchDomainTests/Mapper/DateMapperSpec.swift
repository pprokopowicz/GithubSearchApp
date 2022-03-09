import Foundation
import Quick
import Nimble
@testable import GitHubSearchDomain

final class DateMapperSpec: QuickSpec {
    
    override func spec() {
        describe("DateMapper") {
            var sut: DateMapperProtocol!
            
            beforeEach {
                sut = DateMapper()
            } // beforeEach
            
            it("should map date to 06/05/1980") {
                let returnedDate: Date? = sut.map("1980-05-06T20:00:05Z")
                let expectedDate: Date = Date(timeIntervalSince1970: 326491205)
                
                expect(returnedDate).to(equal(expectedDate))
            }
            
            it("should map date to 25/05/1983") {
                let returnedDate: Date? = sut.map("1983-05-25T10:24:06Z")
                let expectedDate: Date = Date(timeIntervalSince1970: 422706246)
                
                expect(returnedDate).to(equal(expectedDate))
            }
            
            it("should map date to 18/12/2015") {
                let returnedDate: Date? = sut.map("2015-12-18T00:00:00Z")
                let expectedDate: Date = Date(timeIntervalSince1970: 1450396800)
                
                expect(returnedDate).to(equal(expectedDate))
            }
            
            it("should map date to 01/01/2016") {
                let returnedDate: Date? = sut.map("2016-01-01T01:00:00Z")
                let expectedDate: Date = Date(timeIntervalSince1970: 1451610000)
                
                expect(returnedDate).to(equal(expectedDate))
            }
            
            it("should map to nil") {
                let returnedDate: Date? = sut.map("01-01-2016")
                
                expect(returnedDate).to(beNil())
            }
        } // describe
    } // spec
    
}
