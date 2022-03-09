import Foundation
import Swinject
import NetworkKit

public typealias RepositoryProtocol = GitRepoSearchDataProvider & GitRepoTagsDataProvider & GitRepoInformationDataProvider & GitRepoContributorsDataProvider

final class Repository: RepositoryProtocol {
    
    let networkingClient: NetworkClient
    
    init(networkingClient: NetworkClient) {
        self.networkingClient = networkingClient
    }
    
}
