import GitHubSearchData
@testable import GitHubSearchDomain

struct GitRepoInformationMapperMock: GitRepoInformationMapperProtocol {
    func map(_ repoDetails: GitRepoInformationObject) -> GitRepoInformationModel {
        .fixture()
    }
}
