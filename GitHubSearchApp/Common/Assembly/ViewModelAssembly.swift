import Foundation
import GitHubSearchDomain
import Swinject

struct ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RepositorySearchViewModel.self) { (resolver: Resolver, actionSubject: RepositorySearchViewModel.ActionSubject) in
            RepositorySearchViewModel(actionSubject: actionSubject, searchUseCase: resolver.resolve(RepoSearchUseCaseProtocol.self)!)
        }
        
        container.register(RepositoryDetailsViewModel.self) { (resolver: Resolver, parameters: RepositoryDetailsParameters) in
            RepositoryDetailsViewModel(detailsUseCase: resolver.resolve(RepoDetailsUseCaseProtocol.self)!, parameters: parameters)
        }
    }
}
