import Foundation
import GitHubSearchData
import Combine

public protocol RepoSearchUseCaseProtocol {
    func execute(repoName: String) -> AnyPublisher<[GitRepoModel], Error>
}

struct RepoSearchUseCase: RepoSearchUseCaseProtocol {
    
    private let dataProvider: GitRepoSearchDataProvider
    private let repoMapper: GitRepoMapperProtocol
    
    init(dataProvider: GitRepoSearchDataProvider, repoMapper: GitRepoMapperProtocol) {
        self.dataProvider = dataProvider
        self.repoMapper = repoMapper
    }
    
    func execute(repoName: String) -> AnyPublisher<[GitRepoModel], Error> {
        dataProvider.search(repositoryName: repoName)
            .map(\.items)
            .map(repoMapper.map(_:))
            .eraseToAnyPublisher()
    }
    
}
