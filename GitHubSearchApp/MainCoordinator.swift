import Foundation
import Swinject
import Stinsen

final class MainCoordinator: NavigationCoordinatable {
    
    // MARK: - Properties
    
    let stack: NavigationStack<MainCoordinator>
    private let resolver: Resolver
    
    // MARK: - Route
    
    @Root var search = makeSearch
    
    // MARK: - Init
    
    init(resolver: Resolver) {
        self.resolver = resolver
        self.stack = NavigationStack(initial: \MainCoordinator.search)
    }
    
    // MARK: - Child Coordinator
    
    func makeSearch() -> NavigationViewCoordinator<RepositorySearchCoordinator> {
        NavigationViewCoordinator(RepositorySearchCoordinator(resolver: resolver))
    }
}
