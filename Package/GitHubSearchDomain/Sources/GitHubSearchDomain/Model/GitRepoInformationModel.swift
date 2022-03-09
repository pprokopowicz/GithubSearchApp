import Foundation

public struct GitRepoInformationModel: Equatable {
    public let id: Int
    public let name: String
    public let description: String?
    public let language: String?
    public let topics: [String]
    public let owner: GitRepoUserModel
    public let watchers: Int
    public let openIssues: Int
    public let createdAt: Date?
    public let updatedAt: Date?
    
    public init(id: Int, name: String, description: String?, language: String?, topics: [String], owner: GitRepoUserModel, watchers: Int, openIssues: Int, createdAt: Date?, updatedAt: Date?) {
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
