import Foundation
import Swinject

public struct DataAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        assembleNetwork(container: container)
        assembleRepository(container: container)
    }
}
