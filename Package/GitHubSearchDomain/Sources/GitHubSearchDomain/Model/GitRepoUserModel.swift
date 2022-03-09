import Foundation

public struct GitRepoUserModel: Equatable {
    public let id: Int
    public let login: String
    public let avatarUrl: String?
    
    public init(id: Int, login: String, avatarUrl: String?) {
        self.id = id
        self.login = login
        self.avatarUrl = avatarUrl
    }
}
