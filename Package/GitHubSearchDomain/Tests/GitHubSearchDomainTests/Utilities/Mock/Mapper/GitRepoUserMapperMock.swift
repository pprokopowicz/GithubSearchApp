import Foundation
import GitHubSearchData
@testable import GitHubSearchDomain

struct GitRepoUserMapperMock: GitRepoUserMapperProtocol {
    func map(_ serviceObject: GitRepoUserObject) -> GitRepoUserModel {
        .fixture()
    }
}
