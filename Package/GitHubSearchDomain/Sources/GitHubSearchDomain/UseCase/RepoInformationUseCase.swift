import Foundation
import GitHubSearchData
import Combine

public protocol RepoInformationUseCaseProtocol {
    func execute(repoName: String, owner: String) -> AnyPublisher<GitRepoInformationModel, Error>
}

struct RepoInformationUseCase: RepoInformationUseCaseProtocol {
    
    private let dataProvider: GitRepoInformationDataProvider
    private let repoInformationMapper: GitRepoInformationMapperProtocol
    
    init(dataProvider: GitRepoInformationDataProvider, repoInformationMapper: GitRepoInformationMapperProtocol) {
        self.dataProvider = dataProvider
        self.repoInformationMapper = repoInformationMapper
    }
    
    func execute(repoName: String, owner: String) -> AnyPublisher<GitRepoInformationModel, Error> {
        dataProvider.information(repositoryName: repoName, owner: owner)
            .map(repoInformationMapper.map(_:))
            .eraseToAnyPublisher()
    }
    
}
