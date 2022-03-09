import Foundation
import GitHubSearchData

protocol GitRepoMapperProtocol {
    func map(_ serviceObject: GitRepoObject) -> GitRepoModel
}

extension GitRepoMapperProtocol {
    func map(_ serviceArray: [GitRepoObject]) -> [GitRepoModel] {
        serviceArray.map(map(_:))
    }
}

struct GitRepoMapper: GitRepoMapperProtocol {

    private let userMapper: GitRepoUserMapperProtocol
    
    init(userMapper: GitRepoUserMapperProtocol) {
        self.userMapper = userMapper
    }
    
    func map(_ serviceObject: GitRepoObject) -> GitRepoModel {
        GitRepoModel(
            id: serviceObject.id,
            name: serviceObject.name,
            description: serviceObject.description,
            language: serviceObject.language,
            owner: userMapper.map(serviceObject.owner),
            watchers: serviceObject.watchers
        )
    }
}
