import Foundation
import Swinject

extension DomainAssembly {
    func assembleMapper(container: Container) {
        container.register(DateMapperProtocol.self) { _ in
            DateMapper()
        }
        
        container.register(GitRepoTagMapperProtocol.self) { _ in
            GitRepoTagMapper()
        }
        
        container.register(GitRepoInformationMapperProtocol.self) { (resolver: Resolver) in
            GitRepoInformationMapper(userMapper: resolver.resolve(GitRepoUserMapperProtocol.self)!, dateMapper: resolver.resolve(DateMapperProtocol.self)!)
        }
        
        container.register(GitRepoMapperProtocol.self) { (resolver: Resolver) in
            GitRepoMapper(userMapper: resolver.resolve(GitRepoUserMapperProtocol.self)!)
        }
        
        container.register(GitRepoUserMapperProtocol.self) { _ in
            GitRepoUserMapper()
        }
    }
}
