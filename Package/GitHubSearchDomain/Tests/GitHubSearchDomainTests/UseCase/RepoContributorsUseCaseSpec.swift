import Foundation
import Combine
import Quick
import Nimble
import GitHubSearchData
@testable import GitHubSearchDomain

final class RepoContributorsUseCaseSpec: QuickSpec {
    
    override func spec() {
        describe("RepoContributorsUseCase") {
            var dataProvider: RepositoryMock!
            var userMapper: GitRepoUserMapperMock!
            var sut: RepoContributorsUseCaseProtocol!
            var cancellables: Set<AnyCancellable>!
            
            beforeEach {
                cancellables = []
                dataProvider = RepositoryMock()
                userMapper = GitRepoUserMapperMock()
                sut = RepoContributorsUseCase(dataProvider: dataProvider, userMapper: userMapper)
            } // beforeEach
            
            it("should return proper contributors") {
                var returnedContributors: [GitRepoUserModel]!
                sut.execute(repoName: "", owner: "").recorded(&returnedContributors).store(in: &cancellables)
                let expectedContributors: [GitRepoUserModel] = [.fixture(), .fixture(), .fixture(), .fixture()]

                expect(returnedContributors).toEventually(equal(expectedContributors))
            }
            
            it("should return empty array") {
                dataProvider.output = .empty
                var returnedContributors: [GitRepoUserModel]!
                sut.execute(repoName: "", owner: "").recorded(&returnedContributors).store(in: &cancellables)
                let expectedContributors: [GitRepoUserModel] = []

                expect(returnedContributors).toEventually(equal(expectedContributors))
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
