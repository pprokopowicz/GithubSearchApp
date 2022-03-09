import Foundation
import GitHubSearchData
import Combine

public protocol RepoDetailsUseCaseProtocol {
    func execute(repoName: String, owner: String) -> AnyPublisher<GitRepoDetailsModel, Error>
}

struct RepoDetailsUseCase: RepoDetailsUseCaseProtocol {
    
    private let repoInformationUseCase: RepoInformationUseCaseProtocol
    private let tagsUseCase: RepoTagsUseCaseProtocol
    private let contributorsUseCase: RepoContributorsUseCaseProtocol
    
    init(
        repoInformationUseCase: RepoInformationUseCaseProtocol,
        tagsUseCase: RepoTagsUseCaseProtocol,
        contributorsUseCase: RepoContributorsUseCaseProtocol
    ) {
        self.repoInformationUseCase = repoInformationUseCase
        self.tagsUseCase = tagsUseCase
        self.contributorsUseCase = contributorsUseCase
    }
    
    func execute(repoName: String, owner: String) -> AnyPublisher<GitRepoDetailsModel, Error> {
        Publishers.Zip3(
            repoInformationUseCase.execute(repoName: repoName, owner: owner),
            tagsUseCase.execute(repoName: repoName, owner: owner),
            contributorsUseCase.execute(repoName: repoName, owner: owner)
        )
            .map { GitRepoDetailsModel(information: $0, tags: $1, contributors: $2) }
            .eraseToAnyPublisher()
    }
    
}
