import Foundation

public struct GitRepoUserObject: Decodable {
    public let id: Int
    public let login: String
    public let avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case login = "login"
        case avatarUrl = "avatar_url"
    }
    
    public init(id: Int, login: String, avatarUrl: String?) {
        self.id = id
        self.login = login
        self.avatarUrl = avatarUrl
    }
}
