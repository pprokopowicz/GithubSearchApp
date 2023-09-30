import Foundation
import Combine

public protocol GitRepoInformationDataProvider {
    func information(repositoryName: String, owner: String) -> AnyPublisher<GitRepoInformationObject, Error>
}

extension Repository {
    func information(repositoryName: String, owner: String) -> AnyPublisher<GitRepoInformationObject, Error> {
        networkingClient.requestPublisher(request: GitRepoDetailsRequest(owner: owner, repositoryName: repositoryName))
    }
}
