import Foundation
import GitHubSearchData
import Combine
import GitHubSearchDomain

enum MockError: Error, Equatable {
    case failure
}

final class RepositoryMock: RepositoryProtocol {
    enum Output {
        case empty
        case error
        case success
    }
    
    var output: Output = .success
    
    func contributors(repositoryName: String, owner: String) -> AnyPublisher<[GitRepoUserObject], Error> {
        switch output {
        case .empty:
            return Just([])
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        case .error:
            return Fail(error: MockError.failure)
                .eraseToAnyPublisher()
        case .success:
            return Just([.fixture(), .fixture(), .fixture(), .fixture()])
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
    
    func information(repositoryName: String, owner: String) -> AnyPublisher<GitRepoInformationObject, Error> {
        switch output {
        case .empty:
            fatalError("Empty output not possible")
        case .error:
            return Fail(error: MockError.failure)
                .eraseToAnyPublisher()
        case .success:
            return Just(.fixture())
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
    
    func search(repositoryName: String) -> AnyPublisher<GitRepoSearchObject, Error> {
        switch output {
        case .empty:
            return Just(GitRepoSearchObject(totalCount: 100, items: []))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        case .error:
            return Fail(error: MockError.failure)
                .eraseToAnyPublisher()
        case .success:
            return Just(GitRepoSearchObject(totalCount: 100, items: [.fixture(), .fixture(), .fixture(), .fixture(), .fixture()]))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
    
    func tags(repositoryName: String, owner: String) -> AnyPublisher<[GitRepoTagObject], Error> {
        switch output {
        case .empty:
            return Just([])
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        case .error:
            return Fail(error: MockError.failure)
                .eraseToAnyPublisher()
        case .success:
            return Just([GitRepoTagObject(name: "0"), .init(name: "Name1"), .init(name: "Name 2"), .init(name: "Name 3 3 3 3")])
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
}
