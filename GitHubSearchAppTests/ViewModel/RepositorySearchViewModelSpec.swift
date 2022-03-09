//
//  RepositorySearchViewModelSpec.swift
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

final class RepositorySearchViewModelSpec: QuickSpec {
    
    override func spec() {
        describe("RepositorySearchViewModel") {
            var sut: RepositorySearchViewModel!
            var searchUseCase: RepoSearchUseCaseMock!
            var actionSubject: RepositorySearchViewModel.ActionSubject?
            var cancellables: Set<AnyCancellable>!
            
            beforeEach {
                cancellables = []
                searchUseCase = RepoSearchUseCaseMock()
                actionSubject = RepositorySearchViewModel.ActionSubject()
                sut = RepositorySearchViewModel(delay: 0, actionSubject: actionSubject, searchUseCase: searchUseCase)
            } // beforeEach
            
            context("output action") {
                it("should be repository") {
                    sut.$viewState.sink { state in
                        switch state {
                        case .content:
                            sut.handle(.item(0))
                        default:
                            break
                        }
                    }.store(in: &cancellables)
                    sut.handle(.search("asd"))
                    
                    var returnedAction: RepositorySearchExternalAction?
                    actionSubject?.eraseToAnyPublisher().recorded(&returnedAction).store(in: &cancellables)
                    let expectedAction = RepositorySearchExternalAction.repository(.init(name: "First repo", owner: "Login"))
                    
                    expect(returnedAction).toEventually(equal(expectedAction))
                }
            } // context
            
            context("view state") {
                it("should be content") {
                    var returnedStates: [ViewState<[RepositorySearchCellItem]>] = []
                    sut.$viewState.record(to: &returnedStates).store(in: &cancellables)
                    sut.handle(.search("asd"))
                    
                    let expectedItems: [RepositorySearchCellItem] = [
                        RepositorySearchCellItem(id: 0, name: "First repo", description: "Description", language: "Swift", watchers: "100", owner: RepositorySearchCellItem.OwnerItem(name: "Login", avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/10639145?v=4"))),
                        RepositorySearchCellItem(id: 1, name: "First repo", description: "Description", language: "Swift", watchers: "100", owner: RepositorySearchCellItem.OwnerItem(name: "Login", avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/10639145?v=4"))),
                        RepositorySearchCellItem(id: 2, name: "First repo", description: "Description", language: "Swift", watchers: "100", owner: RepositorySearchCellItem.OwnerItem(name: "Login", avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/10639145?v=4"))),
                        RepositorySearchCellItem(id: 3, name: "First repo", description: "Description", language: "Swift", watchers: "100", owner: RepositorySearchCellItem.OwnerItem(name: "Login", avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/10639145?v=4"))),
                        RepositorySearchCellItem(id: 4, name: "First repo", description: "Description", language: "Swift", watchers: "100", owner: RepositorySearchCellItem.OwnerItem(name: "Login", avatarUrl: URL(string: "https://avatars.githubusercontent.com/u/10639145?v=4")))
                    ]
                    let expectedStates: [ViewState<[RepositorySearchCellItem]>] = [.idle, .loading, .content(expectedItems)]
                    
                    expect(returnedStates).toEventually(equal(expectedStates))
                }
                
                it("should be idle") {
                    searchUseCase.output = .empty
                    var returnedStates: [ViewState<[RepositorySearchCellItem]>] = []
                    sut.$viewState.record(to: &returnedStates).store(in: &cancellables)
                    sut.handle(.search("asd"))
                    
                    let expectedStates: [ViewState<[RepositorySearchCellItem]>] = [.idle, .loading, .idle]
                    
                    expect(returnedStates).toEventually(equal(expectedStates))
                }
                
                it("should be error") {
                    searchUseCase.output = .failure
                    var returnedStates: [ViewState<[RepositorySearchCellItem]>] = []
                    sut.$viewState.record(to: &returnedStates).store(in: &cancellables)
                    sut.handle(.search("asd"))
                    
                    let expectedStates: [ViewState<[RepositorySearchCellItem]>] = [.idle, .loading, .empty(MockError.description)]
                    
                    expect(returnedStates).toEventually(equal(expectedStates))
                }
            } // context
        } // describe
    } // spec
    
}
