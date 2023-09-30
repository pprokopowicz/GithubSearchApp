import SwiftUI
import Stinsen
import Swinject

final class RepositoryDetailsCoordinator: NavigationCoordinatable {
    
    // MARK: - Property
    
    private let resolver: Resolver
    let stack: Stinsen.NavigationStack<RepositoryDetailsCoordinator>
    
    // MARK: - Route
    
    @Root private var start = makeStart
    
    // MARK: - Init
    
    init(resolver: Resolver, parameters: RepositoryDetailsParameters) {
        self.resolver = resolver
        self.stack = NavigationStack(initial: \RepositoryDetailsCoordinator.start, parameters)
    }
    
    // MARK: - View
    
    @ViewBuilder func makeStart(parameters: RepositoryDetailsParameters) -> some View {
        resolver.resolve(RepositoryDetailsView<RepositoryDetailsViewModel>.self, argument: parameters)!
    }
}
