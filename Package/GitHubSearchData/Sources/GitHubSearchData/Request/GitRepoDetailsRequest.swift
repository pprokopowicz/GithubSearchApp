import Foundation
import NetworkKit

struct GitRepoDetailsRequest: NetworkRequest {
    
    typealias Output = GitRepoInformationObject
    
    let method: HTTPMethod = .get
    let path: String

    init(owner: String, repositoryName: String) {
        path = "repos/\(owner)/\(repositoryName)"
    }
    
}
