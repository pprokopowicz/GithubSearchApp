import Foundation
import GitHubSearchData

protocol GitRepoTagMapperProtocol {
    func map(_ serviceObject: GitRepoTagObject) -> String
}

extension GitRepoTagMapperProtocol {
    func map(_ serviceArray: [GitRepoTagObject]) -> [String] {
        serviceArray.map(map(_:))
    }
}

struct GitRepoTagMapper: GitRepoTagMapperProtocol {
    func map(_ serviceObject: GitRepoTagObject) -> String {
        serviceObject.name
    }
}
