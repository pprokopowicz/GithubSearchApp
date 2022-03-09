import SwiftUI
import Swinject
import GitHubSearchData
import GitHubSearchDomain
import Stinsen

@main
struct GitHubSearchAppApp: App {
    
    private let resolver: Resolver = {
        let assembler = Assembler([
            DataAssembly(),
            DomainAssembly(),
            ViewModelAssembly(),
            ViewAssembly()
        ])
        
        return assembler.resolver
    }()
    
    var body: some Scene {
        WindowGroup {
            MainCoordinator(resolver: resolver).view()
        }
    }
}
