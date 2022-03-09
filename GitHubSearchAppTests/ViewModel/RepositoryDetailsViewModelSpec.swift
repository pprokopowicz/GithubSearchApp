//
//  RepositoryDetailsViewModelSpec.swift
//  GitHubSearchAppTests
//
//  Created by Piotr Prokopowicz on 24/01/2022.
//

import Foundation
import Combine
import Quick
import Nimble
import GitHubSearchDomain
@testable import GitHubSearchApp

final class RepositoryDetailsViewModelSpec: QuickSpec {
    
    override func spec() {
        describe("RepositoryDetailsViewModel") {
            var sut: RepositoryDetailsViewModel!
            var detailsUseCase: RepoDetailsUseCaseMock!
            var cancellables: Set<AnyCancellable>!
            
            beforeEach {
                cancellables = []
                detailsUseCase = RepoDetailsUseCaseMock()
                sut = RepositoryDetailsViewModel(detailsUseCase: detailsUseCase, parameters: RepositoryDetailsParameters(name: "", owner: ""))
            } // beforeEach
            
            context("view state") {
                it("should be content") {
                    var returnedStates: [ViewState<RepositoryDetailsViewItem>] = []
                    sut.$viewState.record(to: &returnedStates).store(in: &cancellables)
                    sut.handle(.viewDidAppear)

                    let expectedItem: RepositoryDetailsViewItem = RepositoryDetailsViewItem(
                        name: "Some name",
                        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        language: "Swift",
                        topics: ["Swift", "Apple", "Xcode", "SPM", "Cocoapods", "Carthage", "Objective-C", "C++"],
                        watchers: "1254",
                        tagLabel: "Latest tag: 1.5.0. Total: 6",
                        openIssues: "10",
                        createdAt: "06/05/1980",
                        updatedAt: "06/05/1980",
                        owner: RepositoryDetailsViewItem.UserItem(id: 0, name: "Login", avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/10639145?v=4")),
                        contributors: [
                            .init(id: 0, name: "Login", avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/10639145?v=4")),
                            .init(id: 1, name: "Login", avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/10639145?v=4")),
                            .init(id: 2, name: "Login", avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/10639145?v=4")),
                            .init(id: 3, name: "Login", avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/10639145?v=4")),
                            .init(id: 4, name: "Login", avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/10639145?v=4"))
                        ]
                    )
                    let expectedStates: [ViewState<RepositoryDetailsViewItem>] = [.idle, .loading, .content(expectedItem)]

                    expect(returnedStates).toEventually(equal(expectedStates))
                }
                
                it("should be error") {
                    detailsUseCase.output = .failure
                    var returnedStates: [ViewState<RepositoryDetailsViewItem>] = []
                    sut.$viewState.record(to: &returnedStates).store(in: &cancellables)
                    sut.handle(.viewDidAppear)

                    let expectedStates: [ViewState<RepositoryDetailsViewItem>] = [.idle, .loading, .empty(MockError.description)]

                    expect(returnedStates).toEventually(equal(expectedStates))
                }
            } // context
        } // describe
    } // spec
    
}

