import Foundation

extension RepositoryDetailsViewItem {
    static func fixture() -> Self {
        RepositoryDetailsViewItem(
            name: "Repo Name",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
            language: "Swift",
            topics: ["Swift", "http", "http2", "web-framework", "test", "test2"],
            watchers: "222",
            tagLabel: "Latest tag: 1.5.0. Total: 6",
            openIssues: "169",
            createdAt: "01/12/2018",
            updatedAt: "01/02/2022",
            owner: .fixture(id: -1),
            contributors: [
                .fixture(id: 0), .fixture(id: 1), .fixture(id: 2), .fixture(id: 3),
                .fixture(id: 4), .fixture(id: 5), .fixture(id: 6), .fixture(id: 7),
                .fixture(id: 8), .fixture(id: 9), .fixture(id: 10), .fixture(id: 11),
                .fixture(id: 12), .fixture(id: 13), .fixture(id: 14), .fixture(id: 15),
                .fixture(id: 16), .fixture(id: 17), .fixture(id: 18), .fixture(id: 19),
                .fixture(id: 20), .fixture(id: 21), .fixture(id: 22), .fixture(id: 123)
            ]
        )
    }
}

extension RepositoryDetailsViewItem.UserItem {
    static func fixture(id: Int = 0) -> Self {
        RepositoryDetailsViewItem.UserItem(id: id, name: "User Name", avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/17364220?v=4"))
    }
}
