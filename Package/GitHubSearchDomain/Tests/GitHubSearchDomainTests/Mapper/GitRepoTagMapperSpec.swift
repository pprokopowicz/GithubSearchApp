import Foundation
import Quick
import Nimble
import GitHubSearchData
@testable import GitHubSearchDomain

final class GitRepoTagMapperSpec: QuickSpec {
    
    override func spec() {
        describe("GitRepoTagMapper") {
            var sut: GitRepoTagMapperProtocol!
            
            beforeEach {
                sut = GitRepoTagMapper()
            } // beforeEach
            
            it("should map") {
                let returnedUser: String = sut.map(GitRepoTagObject(name: "Name"))
                let expectedUser: String = "Name"
                
                expect(returnedUser).to(equal(expectedUser))
            }
            
            it("should map with whitespace") {
                let returnedUser: String = sut.map(GitRepoTagObject(name: "Name Lastname"))
                let expectedUser: String = "Name Lastname"
                
                expect(returnedUser).to(equal(expectedUser))
            }
            
            it("should map with newline") {
                let returnedUser: String = sut.map(GitRepoTagObject(name: "Name\nLastname"))
                let expectedUser: String = "Name\nLastname"
                
                expect(returnedUser).to(equal(expectedUser))
            }
        } // describe
    } // spec
    
}
