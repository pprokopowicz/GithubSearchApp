//
//  GitRepoDetailsModel+Fixture.swift
//  GitHubSearchApp
//
//  Created by Piotr Prokopowicz on 22/01/2022.
//

import Foundation
import GitHubSearchDomain

extension GitRepoDetailsModel {
    static func fixture() -> Self {
        GitRepoDetailsModel(
            information: .fixture(),
            tags: ["1.5.0", "1.4.0", "1.3.0", "1.2.0", "1.1.0", "1.0.0"],
            contributors: [.fixture(id: 0), .fixture(id: 1), .fixture(id: 2), .fixture(id: 3), .fixture(id: 4)]
        )
    }
}
