//
//  RepoDetailsUseCaseMock.swift
//  GitHubSearchApp
//
//  Created by Piotr Prokopowicz on 22/01/2022.
//

import Foundation
import Combine
import GitHubSearchDomain

final class RepoDetailsUseCaseMock: RepoDetailsUseCaseProtocol {
    
    var output: MockOutput = .success
    
    init() {}
    
    func execute(repoName: String, owner: String) -> AnyPublisher<GitRepoDetailsModel, Error> {
        switch output {
        case .success:
            return Just(.fixture())
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        case .failure:
            return Fail(error: MockError.failure)
                .eraseToAnyPublisher()
        case .empty:
            fatalError("Empty state not supported")
        }
    }
}
