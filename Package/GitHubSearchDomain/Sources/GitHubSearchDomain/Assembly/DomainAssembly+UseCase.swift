import Foundation
import GitHubSearchData
import Swinject

extension DomainAssembly {
    func assembleUseCase(container: Container) {
        container.register(RepoSearchUseCaseProtocol.self) { (resolver: Resolver) in
            RepoSearchUseCase(dataProvider: resolver.resolve(RepositoryProtocol.self)!, repoMapper: resolver.resolve(GitRepoMapperProtocol.self)!)
        }
        
        container.register(RepoContributorsUseCaseProtocol.self) { (resolver: Resolver) in
            RepoContributorsUseCase(dataProvider: resolver.resolve(RepositoryProtocol.self)!, userMapper: resolver.resolve(GitRepoUserMapperProtocol.self)!)
        }
        
        container.register(RepoInformationUseCaseProtocol.self) { (resolver: Resolver) in
            RepoInformationUseCase(dataProvider: resolver.resolve(RepositoryProtocol.self)!, repoInformationMapper: resolver.resolve(GitRepoInformationMapperProtocol.self)!)
        }
        
        container.register(RepoTagsUseCaseProtocol.self) { (resolver: Resolver) in
            RepoTagsUseCase(dataProvider: resolver.resolve(RepositoryProtocol.self)!, tagMapper: resolver.resolve(GitRepoTagMapperProtocol.self)!)
        }
        
        container.register(RepoDetailsUseCaseProtocol.self) { (resolver: Resolver) in
            RepoDetailsUseCase(
                repoInformationUseCase: resolver.resolve(RepoInformationUseCaseProtocol.self)!,
                tagsUseCase: resolver.resolve(RepoTagsUseCaseProtocol.self)!,
                contributorsUseCase: resolver.resolve(RepoContributorsUseCaseProtocol.self)!
            )
        }
    }
}
