import Foundation

struct RepositoryDetailsViewItem: Equatable {
    let name: String
    let description: String
    let language: String?
    let topics: [String]
    let watchers: String
    let tagLabel: String
    let openIssues: String
    let createdAt: String
    let updatedAt: String
    let owner: UserItem
    let contributors: [UserItem]
    
    struct UserItem : Equatable {
        let id: Int
        let name: String
        let avatarUrl: URL?
    }
}
