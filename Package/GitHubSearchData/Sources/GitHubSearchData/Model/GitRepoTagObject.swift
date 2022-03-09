import Foundation

public struct GitRepoTagObject: Decodable {
    public let name: String
    
    public init(name: String) {
        self.name = name
    }
}
