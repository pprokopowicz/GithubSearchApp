import Foundation
import NetworkKit

extension NetworkRequest {
    
    typealias ErrorResponse = NetworkEmpty
    
    var headers: [String: CustomStringConvertible]? {
        [
            "Content-Type": "application/json",
            "Accept": "application/vnd.github.v3+json"
        ]
    }
    var environment: NetworkEnvironment { .default }
    
}
