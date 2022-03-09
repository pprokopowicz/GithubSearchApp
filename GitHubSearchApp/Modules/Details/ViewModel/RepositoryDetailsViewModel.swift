import Foundation
import Combine
import GitHubSearchDomain

final class RepositoryDetailsViewModel: RepositoryDetailsInterface {
    
    // MARK: - Property
    
    @Published private(set) var viewState: ViewState<RepositoryDetailsViewItem> = .idle
    
    private var model: GitRepoDetailsModel?
    private var detailsCancellable: AnyCancellable?
    private let detailsUseCase: RepoDetailsUseCaseProtocol
    
    private let parameters: RepositoryDetailsParameters
    
    // MARK: - Init
    
    init(detailsUseCase: RepoDetailsUseCaseProtocol, parameters: RepositoryDetailsParameters) {
        self.detailsUseCase = detailsUseCase
        self.parameters = parameters
    }
    
    // MARK: - Action
    
    func handle(_ action: RepositoryDetailsAction) {
        switch action {
        case .viewDidAppear:
            guard model == nil else { return }
            fetchData()
        }
    }
    
    private func fetchData() {
        viewState = .loading
        detailsCancellable = detailsUseCase.execute(repoName: parameters.name, owner: parameters.owner)
            .receive(on: RunLoop.main)
            .sink { [weak self] output in
                self?.model = output
                self?.feedView()
            } onFailure: { [weak self] error in
                self?.viewState = .empty(error.localizedDescription)
            }
    }
    
    private func feedView() {
        guard let model = model else {
            viewState = .idle
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/y"
        
        let item: RepositoryDetailsViewItem = RepositoryDetailsViewItem(
            name: model.information.name,
            description: model.information.description ?? "No description",
            language: model.information.language,
            topics: model.information.topics,
            watchers: "\(model.information.watchers)",
            tagLabel: model.tags.first.map { "Latest tag: \($0). Total: \(model.tags.count)" } ?? "No tags",
            openIssues: "\(model.information.openIssues)",
            createdAt: model.information.createdAt.map(dateFormatter.string(from:)) ?? "Unavailable",
            updatedAt: model.information.updatedAt.map(dateFormatter.string(from:)) ?? "Unavailable",
            owner: RepositoryDetailsViewItem.UserItem(
                id: model.information.owner.id,
                name: model.information.owner.login,
                avatarUrl: model.information.owner.avatarUrl.flatMap(URL.init(string:))
            ),
            contributors: model.contributors.map {
                RepositoryDetailsViewItem.UserItem(id: $0.id, name: $0.login, avatarUrl: $0.avatarUrl.flatMap(URL.init(string:)))
            }
        )
        
        viewState = .content(item)
    }
}
