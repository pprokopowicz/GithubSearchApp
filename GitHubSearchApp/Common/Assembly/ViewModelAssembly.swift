import Foundation
import GitHubSearchDomain
import Swinject

struct ViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RepositorySearchViewModel.self) { (resolver: Resolver, actionSubject: RepositorySearchViewModel.ActionSubject) in
            RepositorySearchViewModel(actionSubject: actionSubject, searchUseCase: resolver.resolve(RepoSearchUseCaseProtocol.self)!)
        }
    }
}
