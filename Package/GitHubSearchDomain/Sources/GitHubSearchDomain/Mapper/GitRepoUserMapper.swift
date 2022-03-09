import Foundation
import GitHubSearchData

protocol GitRepoUserMapperProtocol {
    func map(_ serviceObject: GitRepoUserObject) -> GitRepoUserModel
}

extension GitRepoUserMapperProtocol {
    func map(_ serviceArray: [GitRepoUserObject]) -> [GitRepoUserModel] {
        serviceArray.map(map(_:))
    }
}

struct GitRepoUserMapper: GitRepoUserMapperProtocol {
    func map(_ serviceObject: GitRepoUserObject) -> GitRepoUserModel {
        GitRepoUserModel(
            id: serviceObject.id,
            login: serviceObject.login,
            avatarUrl: serviceObject.avatarUrl
        )
    }
}
