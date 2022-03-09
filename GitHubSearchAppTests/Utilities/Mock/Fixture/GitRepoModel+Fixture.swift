//
//  GitRepoModel+Fixture.swift
//  GitHubSearchApp
//
//  Created by Piotr Prokopowicz on 22/01/2022.
//

import Foundation
import GitHubSearchDomain

extension GitRepoModel {
    static func fixture(id: Int = 0) -> Self {
        GitRepoModel(id: id, name: "First repo", description: "Description", language: "Swift", owner: .fixture(), watchers: 100)
    }
}
