import Foundation
import Quick
import Nimble
import GitHubSearchData
@testable import GitHubSearchDomain

final class GitRepoMapperSpec: QuickSpec {
    
    override func spec() {
        describe("GitRepoMapper") {
            var sut: GitRepoMapperProtocol!
            var userMapper: GitRepoUserMapperMock!
            
            beforeEach {
                userMapper = GitRepoUserMapperMock()
                sut = GitRepoMapper(userMapper: userMapper)
            } // beforeEach
            
            it("should map") {
                let returnedRepo: GitRepoModel = sut.map(GitRepoObject(id: 0, name: "Some name", description: nil, language: nil, owner: .fixture(), watchers: 169))
                let expectedRepo: GitRepoModel = .fixture()
                
                expect(returnedRepo).to(equal(expectedRepo))
            }
            
            it("should map with description") {
                let returnedRepo: GitRepoModel = sut.map(GitRepoObject(id: 0, name: "Some name", description: "Some description idk", language: nil, owner: .fixture(), watchers: 169))
                let expectedRepo: GitRepoModel = .fixture(description: "Some description idk")
                
                expect(returnedRepo).to(equal(expectedRepo))
            }
            
            it("should map with language") {
                let returnedRepo: GitRepoModel = sut.map(GitRepoObject(id: 0, name: "Some name", description: nil, language: "Swift", owner: .fixture(), watchers: 169))
                let expectedRepo: GitRepoModel = .fixture(language: "Swift")
                
                expect(returnedRepo).to(equal(expectedRepo))
            }
            
            it("should map with all properties") {
                let returnedRepo: GitRepoModel = sut.map(GitRepoObject(id: 0, name: "Some name", description: "Some description idk", language: "Swift", owner: .fixture(), watchers: 169))
                let expectedRepo: GitRepoModel = .fixture(description: "Some description idk", language: "Swift")
                
                expect(returnedRepo).to(equal(expectedRepo))
            }
        } // describe
    } // spec
    
}
