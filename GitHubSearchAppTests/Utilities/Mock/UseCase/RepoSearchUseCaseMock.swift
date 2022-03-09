//
//  RepoSearchUseCaseMock.swift
//  GitHubSearchApp
//
//  Created by Piotr Prokopowicz on 22/01/2022.
//

import Foundation
import Combine
import GitHubSearchDomain

final class RepoSearchUseCaseMock: RepoSearchUseCaseProtocol {
    
    var output: MockOutput = .success
    
    init() {}
    
    func execute(repoName: String) -> AnyPublisher<[GitRepoModel], Error> {
        switch output {
        case .success:
            return Just([.fixture(id: 0), .fixture(id: 1), .fixture(id: 2), .fixture(id: 3), .fixture(id: 4)])
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: MockError.failure)
                .eraseToAnyPublisher()
        case .empty:
            return Just([])
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
}
