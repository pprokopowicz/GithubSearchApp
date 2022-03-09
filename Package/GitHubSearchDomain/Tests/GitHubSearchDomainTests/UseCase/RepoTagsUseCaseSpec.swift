import Foundation
import Combine
import Quick
import Nimble
import GitHubSearchData
@testable import GitHubSearchDomain

final class RepoTagsUseCaseSpec: QuickSpec {
    
    override func spec() {
        describe("RepoTagsUseCase") {
            var dataProvider: RepositoryMock!
            var tagMapper: GitRepoTagMapperMock!
            var sut: RepoTagsUseCaseProtocol!
            var cancellables: Set<AnyCancellable>!
            
            beforeEach {
                cancellables = []
                dataProvider = RepositoryMock()
                tagMapper = GitRepoTagMapperMock()
                sut = RepoTagsUseCase(dataProvider: dataProvider, tagMapper: tagMapper)
            } // beforeEach
            
            it("should return proper tags") {
                var returnedTags: [String]!
                sut.execute(repoName: "", owner: "").recorded(&returnedTags).store(in: &cancellables)
                let expectedTags: [String] = [.tagFixture(), .tagFixture(), .tagFixture(), .tagFixture()]
                
                expect(returnedTags).toEventually(equal(expectedTags))
            }
            
            it("should return empty array") {
                dataProvider.output = .empty
                var returnedTags: [String]!
                sut.execute(repoName: "", owner: "").recorded(&returnedTags).store(in: &cancellables)
                let expectedTags: [String] = []
                
                expect(returnedTags).toEventually(equal(expectedTags))
            }
            
            it("should return error") {
                dataProvider.output = .error
                var returnedError: Error!
                sut.execute(repoName: "", owner: "").recorded(error: &returnedError).store(in: &cancellables)
                let expectedError: MockError = MockError.failure
                
                expect(returnedError as? MockError).toEventually(equal(expectedError))
            }
        } // describe
    } // spec
    
}
