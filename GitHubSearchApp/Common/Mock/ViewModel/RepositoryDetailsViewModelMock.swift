import Foundation

final class RepositoryDetailsViewModelMock: RepositoryDetailsInterface {
    @Published var viewState: ViewState<RepositoryDetailsViewItem> = .content(.fixture())
    func handle(_ action: RepositoryDetailsAction) {}
}
