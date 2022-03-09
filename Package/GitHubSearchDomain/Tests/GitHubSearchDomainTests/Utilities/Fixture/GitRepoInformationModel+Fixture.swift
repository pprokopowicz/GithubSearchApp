import Foundation
import GitHubSearchData
import GitHubSearchDomain

extension GitRepoInformationModel {
    static func fixture(
        description: String? = nil,
        language: String? = nil,
        topics: [String] = []
    ) -> Self {
        GitRepoInformationModel(
            id: 1,
            name: "Some name",
            description: description,
            language: language,
            topics: topics,
            owner: .fixture(),
            watchers: 420,
            openIssues: 80085,
            createdAt: .fixture(),
            updatedAt: .fixture()
        )
    }
}

extension GitRepoInformationObject {
    static func fixture(
        description: String? = nil,
        language: String? = nil,
        topics: [String] = []
    ) -> Self {
        GitRepoInformationObject(
            id: 1,
            name: "Some name",
            description: description,
            language: language,
            topics: topics,
            owner: .fixture(),
            watchers: 420,
            openIssues: 80085,
            createdAt: .dateFixture(),
            updatedAt: .dateFixture()
        )
    }
}
