import Foundation
import NetworkKit
import Swinject

extension DataAssembly {
    func assembleNetwork(container: Container) {
        container.register(NetworkClient.self) { resolver in
            NetworkClient()
        }.inObjectScope(.container)
    }
}
