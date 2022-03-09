import Foundation
import Combine
import GitHubSearchDomain

final class RepositorySearchViewModel: RepositorySearchInterface {
    
    // MARK: - Binding
    
    @Published private(set) var viewState: ViewState<[RepositorySearchCellItem]>
    private(set) var searchText: String
    
    // MARK: - Property
    
    private var models: [GitRepoModel]
    private var searchCancellable: AnyCancellable?
    private let actionSubject: ActionSubject?
    private let fetchDelay: Double
    
    // MARK: - Dependency
    
    private let searchUseCase: RepoSearchUseCaseProtocol

    // MARK: - Init
    
    init(
        delay: Double = 0.5,
        actionSubject: ActionSubject?,
        searchUseCase: RepoSearchUseCaseProtocol
    ) {
        self.fetchDelay = delay
        self.actionSubject = actionSubject
        self.searchUseCase = searchUseCase
        self.models = []
        
        self.viewState = .idle
        self.searchText = ""
    }
    
    // MARK: - Action
    
    func handle(_ action: RepositorySearchAction) {
        switch action {
        case .search(let query):
            searchText = query
            search(query: searchText)
        case .item(let id):
            guard let repo = models.first(where: { $0.id == id }) else { return }
            actionSubject?.send(.repository(RepositoryDetailsParameters(name: repo.name, owner: repo.owner.login)))
        }
    }
    
    private func search(query: String) {
        guard !query.isEmpty else { return }
        
        searchCancellable?.cancel()
        viewState = .loading
        
        searchCancellable = Just(query)
            .delay(for: RunLoop.SchedulerTimeType.Stride(fetchDelay), scheduler: RunLoop.main)
            .flatMap(searchUseCase.execute(repoName:))
            .receive(on: RunLoop.main)
            .sink { [weak self] output in
                self?.models = output
                self?.feedView()
            } onFailure: { [weak self] error in
                self?.viewState = .empty(error.localizedDescription)
            }
    }
    
    private func feedView() {
        guard !models.isEmpty else {
            viewState = .idle
            return
        }
        
        let items: [RepositorySearchCellItem] = models.map {
            RepositorySearchCellItem(
                id: $0.id,
                name: $0.name,
                description: $0.description,
                language: $0.language,
                watchers: "\($0.watchers)",
                owner: RepositorySearchCellItem.OwnerItem(
                    name: $0.owner.login,
                    avatarUrl: $0.owner.avatarUrl.flatMap(URL.init(string:))
                )
            )
        }
        
        viewState = .content(items)
    }
    
}
