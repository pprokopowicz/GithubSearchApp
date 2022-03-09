//
//  MockOutput.swift
//  GitHubSearchApp
//
//  Created by Piotr Prokopowicz on 24/01/2022.
//

import Foundation

enum MockOutput {
    case success
    case failure
    case empty
}

enum MockError: LocalizedError, Equatable {
    static let description: String = "Mock error description"
    case failure
    
    public var errorDescription: String? {
        switch self {
        case .failure:
            return Self.description
        }
    }
}
