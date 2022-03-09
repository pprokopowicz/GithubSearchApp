import GitHubSearchData
@testable import GitHubSearchDomain

struct GitRepoTagMapperMock: GitRepoTagMapperProtocol {
    func map(_ serviceObject: GitRepoTagObject) -> String {
        .tagFixture()
    }
}
