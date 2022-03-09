import Foundation
import Combine
import Quick
import Nimble
import GitHubSearchData
@testable import GitHubSearchDomain

final class RepoSearchUseCaseSpec: QuickSpec {
    
    override func spec() {
        describe("RepoSearchUseCase") {
            var dataProvider: RepositoryMock!
            var repoMapper: GitRepoMapperMock!
            var sut: RepoSearchUseCaseProtocol!
            var cancellables: Set<AnyCancellable>!
            
            beforeEach {
                cancellables = []
                dataProvider = RepositoryMock()
                repoMapper = GitRepoMapperMock()
                sut = RepoSearchUseCase(dataProvider: dataProvider, repoMapper: repoMapper)
            } // beforeEach
            
            it("should return proper contributors") {
                var returnedRepos: [GitRepoModel]!
                sut.execute(repoName: "").recorded(&returnedRepos).store(in: &cancellables)
                let expectedRepos: [GitRepoModel] = [.fixture(), .fixture(), .fixture(), .fixture(), .fixture()]

                expect(returnedRepos).toEventually(equal(expectedRepos))
            }
            
            it("should return empty array") {
                dataProvider.output = .empty
                var returnedRepos: [GitRepoModel]!
                sut.execute(repoName: "").recorded(&returnedRepos).store(in: &cancellables)
                let expectedRepos: [GitRepoModel] = []

                expect(returnedRepos).toEventually(equal(expectedRepos))
            }
            
            it("should return error") {
                dataProvider.output = .error
                var returnedError: Error!
                sut.execute(repoName: "").recorded(error: &returnedError).store(in: &cancellables)
                let expectedError: MockError = MockError.failure

                expect(returnedError as? MockError).toEventually(equal(expectedError))
            }
        } // describe
    } // spec
    
}
