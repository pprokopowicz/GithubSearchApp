import SwiftUI
import Swinject

struct RepositoryDetailsView<ViewModel: RepositoryDetailsInterface>: View {
    
    // MARK: - Property
    
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
                EmptyView()
            case .content(let item):
                content(item: item)
                    .navigationTitle(item.name)
            case .empty(let message):
                Text(message)
                    .multilineTextAlignment(.center)
            case .loading:
                ProgressView()
            }
        }
        .onAppear {
            viewModel.handle(.viewDidAppear)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private func content(item: RepositoryDetailsViewItem) -> some View {
        ScrollView {
            VStack(alignment: .leading) {
                ownerView(item: item.owner)
                    .padding(.horizontal, 16)
                Text(item.description)
                    .padding(.horizontal, 16)
                watchersView(item: item)
                    .padding(.horizontal, 16)
                topicsView(item: item.topics)
                Text("Information")
                    .font(.title)
                    .padding(.horizontal, 16)
                informationView(item: item)
                    .padding(.horizontal, 16)
                Text("Contributors")
                    .font(.title)
                    .padding(.horizontal, 16)
                contributorsView(item: item.contributors)
                    .padding(.horizontal, 16)
            }
        }
    }
    
    @ViewBuilder
    private func ownerView(item: RepositoryDetailsViewItem.UserItem) -> some View {
        HStack {
            AvatarView(url: item.avatarUrl)
                .frame(width: 30, height: 30)
            Text(item.name)
                .foregroundColor(.gray)
                .font(.caption)
        }
    }
    
    @ViewBuilder
    private func watchersView(item: RepositoryDetailsViewItem) -> some View {
        HStack {
            Image(systemName: "star")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(.gray)
            Text(item.watchers + " stars")
                .fontWeight(.light)
            Spacer()
                .frame(width: 16)
            if let language = item.language {
                Text(language)
                    .fontWeight(.light)
            }
        }
    }
    
    @ViewBuilder
    private func topicsView(item: [String]) -> some View {
        ScrollView (.horizontal, showsIndicators: false) {
             HStack {
                 Rectangle()
                     .frame(width: 16)
                     .foregroundColor(.clear)
                 ForEach(item, id: \.self) { text in
                     Text(text)
                         .foregroundColor(.white)
                         .padding(8)
                         .background(Color.gray.opacity(0.5))
                         .clipShape(Capsule())
                 }
                 Rectangle()
                     .frame(width: 16)
                     .foregroundColor(.clear)
             }
        }
    }
    
    @ViewBuilder
    private func informationView(item: RepositoryDetailsViewItem) -> some View {
        VStack {
            informationCell(image: "smallcircle.filled.circle", imageColor: .orange, title: "Issues", info: item.openIssues)
            lineView()
            informationCell(image: "tag", imageColor: .indigo, title: "Tag", info: item.tagLabel)
            lineView()
            informationCell(image: "calendar", imageColor: .blue, title: "Created", info: item.createdAt)
            lineView()
            informationCell(image: "calendar", imageColor: .green, title: "Updated", info: item.updatedAt)
        }
        .padding()
        .background(Color.gray.opacity(0.5))
        .cornerRadius(8)
    }
    
    @ViewBuilder
    private func informationCell(image: String, imageColor: Color, title: String, info: String) -> some View {
        VStack {
            HStack {
                Image(systemName: image)
                    .resizable()
                    .frame(width: 16, height: 16)
                    .padding(6)
                    .background(imageColor.cornerRadius(4))
                    .foregroundColor(.white)
                Text(title)
                    .foregroundColor(.white)
                Spacer()
                Text(info)
                    .foregroundColor(.white)
            }
        }
    }
    
    @ViewBuilder
    private func lineView() -> some View {
        Rectangle()
            .foregroundColor(.white.opacity(0.5))
            .padding(.leading, 32)
            .frame(height: 1)
    }
    
    @ViewBuilder
    private func contributorsView(item: [RepositoryDetailsViewItem.UserItem]) -> some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 110))], alignment: .center, spacing: 16) {
            ForEach(item, id: \.id) { contributor in
                contributorsCell(item: contributor)
            }
        }
    }
    
    @ViewBuilder
    private func contributorsCell(item: RepositoryDetailsViewItem.UserItem) -> some View {
        VStack {
            AvatarView(url: item.avatarUrl)
                .frame(width: 75, height: 75)
            Text(item.name)
                .font(.caption)
                .foregroundColor(.white)
                .lineLimit(1)
        }
        .padding(8)
        .frame(width: 110, height: 110)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(8)
    }
}

// MARK: - PreviewProvider

struct RepositoryDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RepositoryDetailsView(viewModel: RepositoryDetailsViewModelMock())
        }
    }
}
