import Foundation
import Swinject

public struct DomainAssembly: Assembly {
    public init() {}
    
    public func assemble(container: Container) {
        assembleMapper(container: container)
        assembleUseCase(container: container)
    }
}
