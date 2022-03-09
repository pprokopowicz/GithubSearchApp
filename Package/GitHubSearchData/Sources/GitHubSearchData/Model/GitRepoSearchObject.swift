import Foundation

public struct GitRepoSearchObject: Decodable {
    public let totalCount: Int
    public let items: [GitRepoObject]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items = "items"
    }
    
    public init(totalCount: Int, items: [GitRepoObject]) {
        self.totalCount = totalCount
        self.items = items
    }
}
