import SwiftUI
import Combine
import Stinsen
import Swinject

final class RepositorySearchCoordinator: NavigationCoordinatable {
    
    // MARK: - Property
    
    private let resolver: Resolver
    private var actionCancellable: AnyCancellable?
    let stack: Stinsen.NavigationStack<RepositorySearchCoordinator>
    
    // MARK: - Route
    
    @Root private var start = makeStart
    @Route(.push) var details = makeDetails
    
    // MARK: - Init
    
    init(resolver: Resolver) {
        self.resolver = resolver
        self.stack = NavigationStack(initial: \RepositorySearchCoordinator.start)
    }
    
    // MARK: - View
    
    @ViewBuilder func makeStart() -> some View {
        resolver.resolve(RepositorySearchView<RepositorySearchViewModel>.self, argument: actionSubject())!
    }
    
    // MARK: - ActionHandler
    
    private func actionSubject() -> RepositorySearchViewModel.ActionSubject {
        let subject = RepositorySearchViewModel.ActionSubject()
        
        actionCancellable = subject.sink { [weak self] action in
            guard let self = self else { return }
            switch action {
            case .repository(let parameters):
                self.route(to: \.details, parameters)
            }
        }
        
        return subject
    }
    
    // MARK: - Child Coordinator
    
    func makeDetails(parameters: RepositoryDetailsParameters) -> RepositoryDetailsCoordinator {
        RepositoryDetailsCoordinator(resolver: resolver, parameters: parameters)
    }
}
