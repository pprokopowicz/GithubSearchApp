import Foundation
import Quick
import Nimble
import GitHubSearchData
@testable import GitHubSearchDomain

final class GitRepoUserMapperSpec: QuickSpec {
    
    override func spec() {
        describe("GitRepoUserMapper") {
            var sut: GitRepoUserMapperProtocol!
            
            beforeEach {
                sut = GitRepoUserMapper()
            } // beforeEach
            
            it("should map without avatar") {
                let returnedUser: GitRepoUserModel = sut.map(GitRepoUserObject(id: 0, login: "Login", avatarUrl: nil))
                let expectedUser: GitRepoUserModel = GitRepoUserModel(id: 0, login: "Login", avatarUrl: nil)
                
                expect(returnedUser).to(equal(expectedUser))
            }
            
            it("should map with avatar") {
                let returnedUser: GitRepoUserModel = sut.map(GitRepoUserObject(id: 0, login: "Login", avatarUrl: "https://fakeurl.com/pic.jpg"))
                let expectedUser: GitRepoUserModel = GitRepoUserModel(id: 0, login: "Login", avatarUrl: "https://fakeurl.com/pic.jpg")
                
                expect(returnedUser).to(equal(expectedUser))
            }
            
            it("should map with login (with whitespace) and avatar") {
                let returnedUser: GitRepoUserModel = sut.map(GitRepoUserObject(id: 0, login: "Login Some Other Parts idk", avatarUrl: "https://fakeurl.com/pic.jpg"))
                let expectedUser: GitRepoUserModel = GitRepoUserModel(id: 0, login: "Login Some Other Parts idk", avatarUrl: "https://fakeurl.com/pic.jpg")
                
                expect(returnedUser).to(equal(expectedUser))
            }
        } // describe
    } // spec
    
}
