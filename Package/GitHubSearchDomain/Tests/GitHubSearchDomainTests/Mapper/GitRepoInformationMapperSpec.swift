import Foundation
import Quick
import Nimble
import GitHubSearchData
@testable import GitHubSearchDomain

final class GitRepoInformationMapperSpec: QuickSpec {
    
    override func spec() {
        describe("GitRepoTagMapper") {
            var userMapper: GitRepoUserMapperMock!
            var dateMapper: DateMapperMock!
            var sut: GitRepoInformationMapperProtocol!
            
            beforeEach {
                userMapper = GitRepoUserMapperMock()
                dateMapper = DateMapperMock()
                sut = GitRepoInformationMapper(userMapper: userMapper, dateMapper: dateMapper)
            } // beforeEach
            
            it("should map") {
                let returnedInfo: GitRepoInformationModel = sut.map(GitRepoInformationObject(id: 1, name: "Some name", description: nil, language: nil, topics: [], owner: .fixture(), watchers: 420, openIssues: 80085, createdAt: .dateFixture(), updatedAt: .dateFixture()))
                let expectedInfo: GitRepoInformationModel = .fixture()
                
                expect(returnedInfo).to(equal(expectedInfo))
            }
            
            it("should map with description") {
                let returnedInfo: GitRepoInformationModel = sut.map(GitRepoInformationObject(id: 1, name: "Some name", description: "Some description idk", language: nil, topics: [], owner: .fixture(), watchers: 420, openIssues: 80085, createdAt: .dateFixture(), updatedAt: .dateFixture()))
                let expectedInfo: GitRepoInformationModel = .fixture(description: "Some description idk")
                
                expect(returnedInfo).to(equal(expectedInfo))
            }
            
            it("should map with language") {
                let returnedInfo: GitRepoInformationModel = sut.map(GitRepoInformationObject(id: 1, name: "Some name", description: nil, language: "Objective-C", topics: [], owner: .fixture(), watchers: 420, openIssues: 80085, createdAt: .dateFixture(), updatedAt: .dateFixture()))
                let expectedInfo: GitRepoInformationModel = .fixture(language: "Objective-C")
                
                expect(returnedInfo).to(equal(expectedInfo))
            }
            
            it("should map with topics") {
                let returnedInfo: GitRepoInformationModel = sut.map(GitRepoInformationObject(id: 1, name: "Some name", description: nil, language: nil, topics: ["aa", "bb", "c c c"], owner: .fixture(), watchers: 420, openIssues: 80085, createdAt: .dateFixture(), updatedAt: .dateFixture()))
                let expectedInfo: GitRepoInformationModel = .fixture(topics: ["aa", "bb", "c c c"])
                
                expect(returnedInfo).to(equal(expectedInfo))
            }
            
            it("should map all properties") {
                let returnedInfo: GitRepoInformationModel = sut.map(GitRepoInformationObject(id: 1, name: "Some name", description: "Some description idk", language: "Objective-C", topics: ["aa", "bb", "c c c"], owner: .fixture(), watchers: 420, openIssues: 80085, createdAt: .dateFixture(), updatedAt: .dateFixture()))
                let expectedInfo: GitRepoInformationModel = .fixture(description: "Some description idk", language: "Objective-C", topics: ["aa", "bb", "c c c"])
                
                expect(returnedInfo).to(equal(expectedInfo))
            }
        } // describe
    } // spec
    
}
