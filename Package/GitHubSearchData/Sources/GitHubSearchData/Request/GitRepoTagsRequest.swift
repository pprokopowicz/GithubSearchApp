import Foundation
import NetworkKit

struct GitRepoTagsRequest: NetworkRequest {
    
    typealias Output = [GitRepoTagObject]
    
    let method: HTTPMethod = .get
    let path: String

    init(owner: String, repositoryName: String) {
        path = "repos/\(owner)/\(repositoryName)/tags"
    }
    
}
