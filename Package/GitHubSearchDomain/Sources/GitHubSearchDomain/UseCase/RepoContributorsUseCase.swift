import Foundation
import GitHubSearchData
import Combine

public protocol RepoContributorsUseCaseProtocol {
    func execute(repoName: String, owner: String) -> AnyPublisher<[GitRepoUserModel], Error>
}

struct RepoContributorsUseCase: RepoContributorsUseCaseProtocol {
    
    private let dataProvider: GitRepoContributorsDataProvider
    private let userMapper: GitRepoUserMapperProtocol
    
    init(dataProvider: GitRepoContributorsDataProvider, userMapper: GitRepoUserMapperProtocol) {
        self.dataProvider = dataProvider
        self.userMapper = userMapper
    }
    
    func execute(repoName: String, owner: String) -> AnyPublisher<[GitRepoUserModel], Error> {
        dataProvider.contributors(repositoryName: repoName, owner: owner)
            .map(userMapper.map(_:))
            .eraseToAnyPublisher()
    }
    
}
