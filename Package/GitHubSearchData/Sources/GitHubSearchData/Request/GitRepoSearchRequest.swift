import Foundation
import NetworkKit

struct GitRepoSearchRequest: NetworkRequest {
    
    typealias Output = GitRepoSearchObject
    
    let method: HTTPMethod = .get
    let queryParameters: [String: CustomStringConvertible]?
    let path: String = "search/repositories"

    init(query: String) {
        queryParameters = ["q": query]
    }
    
}
