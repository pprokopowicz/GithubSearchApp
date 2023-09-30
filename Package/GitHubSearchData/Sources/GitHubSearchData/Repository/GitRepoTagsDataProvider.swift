import Foundation
import Combine

public protocol GitRepoTagsDataProvider {
    func tags(repositoryName: String, owner: String) -> AnyPublisher<[GitRepoTagObject], Error>
}

extension Repository {
    func tags(repositoryName: String, owner: String) -> AnyPublisher<[GitRepoTagObject], Error> {
        networkingClient.requestPublisher(request: GitRepoTagsRequest(owner: owner, repositoryName: repositoryName))
    }
}
