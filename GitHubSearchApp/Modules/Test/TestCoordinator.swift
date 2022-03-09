import Foundation
import Stinsen
import SwiftUI

final class TestCoordinator: NavigationCoordinatable {
    
    // MARK: - Properties
    
    let stack: NavigationStack<TestCoordinator>
    private let repoName: String
    
    // MARK: - Route
    
    @Root var start = makeStart
    
    // MARK: - Init
    
    init(repoName: String) {
        self.stack = NavigationStack(initial: \TestCoordinator.start)
        self.repoName = repoName
    }
    
    // MARK: - Child Coordinator
    
    @ViewBuilder func makeStart() -> some View {
        Text("Details: \(repoName)")
    }
}
