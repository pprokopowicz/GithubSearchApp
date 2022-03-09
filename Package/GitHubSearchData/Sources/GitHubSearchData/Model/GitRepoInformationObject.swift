import Foundation

public struct GitRepoInformationObject: Decodable {
    public let id: Int
    public let name: String
    public let description: String?
    public let language: String?
    public let topics: [String]
    public let owner: GitRepoUserObject
    public let watchers: Int
    public let openIssues: Int
    public let createdAt: String
    public let updatedAt: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case description = "description"
        case language = "language"
        case topics = "topics"
        case owner = "owner"
        case watchers = "watchers"
        case openIssues = "open_issues"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
    
    public init(id: Int, name: String, description: String?, language: String?, topics: [String], owner: GitRepoUserObject, watchers: Int, openIssues: Int, createdAt: String, updatedAt: String) {
        self.id = id
        self.name = name
        self.description = description
        self.language = language
        self.topics = topics
        self.owner = owner
        self.watchers = watchers
        self.openIssues = openIssues
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}
