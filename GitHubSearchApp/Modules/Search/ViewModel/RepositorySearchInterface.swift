import Foundation
import Combine

protocol RepositorySearchInterface: ObservableObject {
    var viewState: ViewState<[RepositorySearchCellItem]> { get }
    var searchText: String { get }
    func handle(_ action: RepositorySearchAction)
}

extension RepositorySearchInterface {
    typealias ActionSubject = PassthroughSubject<RepositorySearchExternalAction, Never>
}

enum RepositorySearchAction {
    case search(String)
    case item(Int)
}

enum RepositorySearchExternalAction: Equatable {
    case repository(RepositoryDetailsParameters)
}
