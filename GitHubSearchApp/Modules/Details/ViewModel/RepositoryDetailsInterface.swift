import Foundation

protocol RepositoryDetailsInterface: ObservableObject {
    var viewState: ViewState<RepositoryDetailsViewItem> { get }
    func handle(_ action: RepositoryDetailsAction)
}

enum RepositoryDetailsAction {
    case viewDidAppear
}

struct RepositoryDetailsParameters: Equatable {
    let name: String
    let owner: String
}
