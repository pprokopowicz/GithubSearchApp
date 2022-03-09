import Foundation

extension RepositorySearchCellItem {
    static func fixture(id: Int = 0) -> Self {
        RepositorySearchCellItem(
            id: id,
            name: "Repo Name",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
            language: "Swift",
            watchers: "420",
            owner: .fixture()
        )
    }
}

extension RepositorySearchCellItem.OwnerItem {
    static func fixture(id: Int = 0) -> Self {
        RepositorySearchCellItem.OwnerItem(name: "Owner Name", avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/17364220?v=4"))
    }
}
