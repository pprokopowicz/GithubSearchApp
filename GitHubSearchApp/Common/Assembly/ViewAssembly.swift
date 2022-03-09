import Foundation
import Swinject

struct ViewAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RepositorySearchView.self) { (resolver: Resolver, actionSubject: RepositorySearchViewModel.ActionSubject) in
            RepositorySearchView(viewModel: resolver.resolve(RepositorySearchViewModel.self, argument: actionSubject)!)
        }
        
        container.register(RepositoryDetailsView.self) { (resolver: Resolver, parameters: RepositoryDetailsParameters) in
            RepositoryDetailsView(viewModel: resolver.resolve(RepositoryDetailsViewModel.self, argument: parameters)!)
        }
    }
}
