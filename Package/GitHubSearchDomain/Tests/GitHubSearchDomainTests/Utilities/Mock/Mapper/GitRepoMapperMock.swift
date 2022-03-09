import GitHubSearchData
@testable import GitHubSearchDomain

struct GitRepoMapperMock: GitRepoMapperProtocol {
    func map(_ serviceObject: GitRepoObject) -> GitRepoModel {
        .fixture()
    }
}
