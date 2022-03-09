import Foundation
import GitHubSearchData
import Combine

public protocol RepoTagsUseCaseProtocol {
    func execute(repoName: String, owner: String) -> AnyPublisher<[String], Error>
}

struct RepoTagsUseCase: RepoTagsUseCaseProtocol {

    private let dataProvider: GitRepoTagsDataProvider
    private let tagMapper: GitRepoTagMapperProtocol

    init(dataProvider: GitRepoTagsDataProvider, tagMapper: GitRepoTagMapperProtocol) {
        self.dataProvider = dataProvider
        self.tagMapper = tagMapper
    }

    func execute(repoName: String, owner: String) -> AnyPublisher<[String], Error> {
        dataProvider.tags(repositoryName: repoName, owner: owner)
            .map(tagMapper.map(_:))
            .eraseToAnyPublisher()
    }

}
