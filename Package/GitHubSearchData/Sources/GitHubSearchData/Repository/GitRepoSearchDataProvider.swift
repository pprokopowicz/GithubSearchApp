import Foundation
import Combine

public protocol GitRepoSearchDataProvider {
    func search(repositoryName: String) -> AnyPublisher<GitRepoSearchObject, Error>
}

extension Repository {
    func search(repositoryName: String) -> AnyPublisher<GitRepoSearchObject, Error> {
        networkingClient.requestPublisher(request: GitRepoSearchRequest(query: repositoryName))
    }
}
