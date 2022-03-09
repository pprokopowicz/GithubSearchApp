import SwiftUI
import Swinject

struct RepositorySearchView<ViewModel: RepositorySearchInterface>: View {
    
    // MARK: - Dependeny
    
    @ObservedObject private var viewModel: ViewModel
    
    // MARK: - Init
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - View
    
    var body: some View {
        VStack {
            switch viewModel.viewState {
            case .idle:
                Text("No search results")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            case .content(let items):
                List(items) { item in
                    RepositorySearchCell(item: item) {
                        viewModel.handle(.item(item.id))
                    }
                }
            case .empty(let message):
                Text(message)
                    .multilineTextAlignment(.center)
            case .loading:
                ProgressView()
            }
        }
        .searchable(
            text: .init(
                get: { viewModel.searchText },
                set: { viewModel.handle(.search($0)) }
            )
        )
        .disableAutocorrection(true)
        .navigationTitle("Search")
    }
    
}

// MARK: - PreviewProvider

struct RepositorySearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RepositorySearchView(viewModel: RepositorySearchViewModelMock())
        }
    }
}
