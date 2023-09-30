import Foundation
import Combine

public protocol GitRepoContributorsDataProvider {
    func contributors(repositoryName: String, owner: String) -> AnyPublisher<[GitRepoUserObject], Error>
}

extension Repository {
    func contributors(repositoryName: String, owner: String) -> AnyPublisher<[GitRepoUserObject], Error> {
        networkingClient.requestPublisher(request: GitRepoContributorsRequest(owner: owner, repositoryName: repositoryName))
    }
}
