import Foundation
import GitHubSearchData
import GitHubSearchDomain

extension GitRepoUserModel {
    static func fixture() -> Self {
        GitRepoUserModel(
            id: 0,
            login: "SomeLogin",
            avatarUrl: "https://fakeUrl.com/pic.jpg"
        )
    }
}

extension GitRepoUserObject {
    static func fixture() -> Self {
        GitRepoUserObject(
            id: 0,
            login: "SomeLogin",
            avatarUrl: "https://fakeUrl.com/pic.jpg"
        )
    }
}
