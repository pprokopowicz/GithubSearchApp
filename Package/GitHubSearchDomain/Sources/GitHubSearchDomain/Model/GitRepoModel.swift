import Foundation

public struct GitRepoModel: Equatable {
    public let id: Int
    public let name: String
    public let description: String?
    public let language: String?
    public let owner: GitRepoUserModel
    public let watchers: Int
    
    public init(id: Int, name: String, description: String?, language: String?, owner: GitRepoUserModel, watchers: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.language = language
        self.owner = owner
        self.watchers = watchers
    }
}
