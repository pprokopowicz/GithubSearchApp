import Foundation

struct RepositorySearchCellItem: Equatable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let language: String?
    let watchers: String
    let owner: OwnerItem
    
    struct OwnerItem: Equatable {
        let name: String
        let avatarUrl: URL?
    }
}
