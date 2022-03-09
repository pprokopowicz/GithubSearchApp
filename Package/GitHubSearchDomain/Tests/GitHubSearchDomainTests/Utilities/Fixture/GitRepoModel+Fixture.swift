import Foundation
import GitHubSearchData
import GitHubSearchDomain

extension GitRepoModel {
    static func fixture(
        description: String? = nil,
        language: String? = nil
    ) -> Self {
        GitRepoModel(
            id: 0,
            name: "Some name",
            description: description,
            language: language,
            owner: .fixture(),
            watchers: 169
        )
    }
}

extension GitRepoObject {
    static func fixture(
        description: String? = nil,
        language: String? = nil
    ) -> Self {
        GitRepoObject(
            id: 0,
            name: "Some name",
            description: description,
            language: language,
            owner: .fixture(),
            watchers: 169
        )
    }
}
