import Foundation
import Swinject
import GitHubSearchData

protocol GitRepoInformationMapperProtocol {
    func map(_ repoDetails: GitRepoInformationObject) -> GitRepoInformationModel
}

struct GitRepoInformationMapper: GitRepoInformationMapperProtocol {

    private let userMapper: GitRepoUserMapperProtocol
    private let dateMapper: DateMapperProtocol
    
    init(userMapper: GitRepoUserMapperProtocol, dateMapper: DateMapperProtocol) {
        self.userMapper = userMapper
        self.dateMapper = dateMapper
    }
    
    func map(_ repoDetails: GitRepoInformationObject) -> GitRepoInformationModel {
        GitRepoInformationModel(
            id: repoDetails.id,
            name: repoDetails.name,
            description: repoDetails.description,
            language: repoDetails.language,
            topics: repoDetails.topics,
            owner: userMapper.map(repoDetails.owner),
            watchers: repoDetails.watchers,
            openIssues: repoDetails.openIssues,
            createdAt: dateMapper.map(repoDetails.createdAt),
            updatedAt: dateMapper.map(repoDetails.updatedAt)
        )
    }
}
