import Foundation
import Combine

final class RepositorySearchViewModelMock: RepositorySearchInterface {
    @Published var viewState: ViewState<[RepositorySearchCellItem]> = .content([
        .fixture(id: 0), .fixture(id: 1), .fixture(id: 2), .fixture(id: 3),
        .fixture(id: 4), .fixture(id: 5), .fixture(id: 6), .fixture(id: 7),
        .fixture(id: 8), .fixture(id: 9), .fixture(id: 10), .fixture(id: 11),
        .fixture(id: 12), .fixture(id: 13), .fixture(id: 14), .fixture(id: 15),
        .fixture(id: 16), .fixture(id: 17), .fixture(id: 18), .fixture(id: 19)
    ])
    var searchText: String = ""
    func handle(_ action: RepositorySearchAction) {}
}
