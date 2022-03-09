import Foundation
import Combine
import Quick
import Nimble
import GitHubSearchData
@testable import GitHubSearchDomain

final class RepoInformationUseCaseSpec: QuickSpec {
    
    override func spec() {
        describe("RepoInformationUseCase") {
            var dataProvider: RepositoryMock!
            var repoInformationMapper: GitRepoInformationMapperMock!
            var sut: RepoInformationUseCaseProtocol!
            var cancellables: Set<AnyCancellable>!
            
            beforeEach {
                cancellables = []
                dataProvider = RepositoryMock()
                repoInformationMapper = GitRepoInformationMapperMock()
                sut = RepoInformationUseCase(dataProvider: dataProvider, repoInformationMapper: repoInformationMapper)
            } // beforeEach
            
            it("should return information") {
                var returnedInfo: GitRepoInformationModel!
                sut.execute(repoName: "", owner: "").recorded(&returnedInfo).store(in: &cancellables)
                let expectedInfo: GitRepoInformationModel = .fixture()

                expect(returnedInfo).toEventually(equal(expectedInfo))
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
