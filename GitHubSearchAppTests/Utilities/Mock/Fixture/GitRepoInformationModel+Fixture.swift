//
//  GitRepoInformationModel+Fixture.swift
//  GitHubSearchApp
//
//  Created by Piotr Prokopowicz on 22/01/2022.
//

import Foundation
import GitHubSearchDomain

extension GitRepoInformationModel {
    static func fixture() -> Self {
        GitRepoInformationModel(
            id: 0,
            name: "Some name",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            language: "Swift",
            topics: ["Swift", "Apple", "Xcode", "SPM", "Cocoapods", "Carthage", "Objective-C", "C++"],
            owner: .fixture(),
            watchers: 1254,
            openIssues: 10,
            createdAt: .fixture(),
            updatedAt: .fixture()
        )
    }
}
