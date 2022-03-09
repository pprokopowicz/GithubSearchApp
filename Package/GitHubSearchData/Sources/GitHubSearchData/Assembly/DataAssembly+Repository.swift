import Foundation
import NetworkKit
import Swinject

extension DataAssembly {
    func assembleRepository(container: Container) {
        container.register(RepositoryProtocol.self) { resolver in
            Repository(networkingClient: resolver.resolve(NetworkClient.self)!)
        }.inObjectScope(.container)
    }
}
