//
//  GitRepoUserModel+Fixture.swift
//  GitHubSearchApp
//
//  Created by Piotr Prokopowicz on 22/01/2022.
//

import Foundation
import GitHubSearchDomain

extension GitRepoUserModel {
    static func fixture(id: Int = 0) -> Self {
        GitRepoUserModel(id: id, login: "Login", avatarUrl: "https://avatars.githubusercontent.com/u/10639145?v=4")
    }
}
