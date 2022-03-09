import Foundation
import NetworkKit

struct GitRepoContributorsRequest: NetworkRequest {
    
    typealias Output = [GitRepoUserObject]
    
    let method: HTTPMethod = .get
    let path: String

    init(owner: String, repositoryName: String) {
        path = "repos/\(owner)/\(repositoryName)/contributors"
    }
    
}
