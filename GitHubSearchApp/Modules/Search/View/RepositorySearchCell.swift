import SwiftUI

struct RepositorySearchCell: View {
    
    // MARK: - Property
    
    private let item: RepositorySearchCellItem
    private let action: () -> Void
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: - Init
    
    init(item: RepositorySearchCellItem, action: @escaping () -> Void) {
        self.item = item
        self.action = action
    }
    
    // MARK: - View
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading) {
                HStack {
                    AvatarView(url: item.owner.avatarUrl)
                        .frame(width: 30, height: 30)
                    Text(item.owner.name)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                Text(item.name)
                    .fontWeight(.bold)
                if let description = item.description {
                    Text(description)
                        .fontWeight(.light)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                }
                
                HStack {
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(.gray)
                    Text(item.watchers)
                        .fontWeight(.light)
                    Spacer()
                        .frame(width: 16)
                    if let language = item.language {
                        Text(language)
                            .fontWeight(.light)
                    }
                }
            }
        }
        .foregroundColor(colorScheme == .dark ? .white : .black)
    }
}

// MARK: - PreviewProvider

struct RepositorySearchCell_Previews: PreviewProvider {
    static var previews: some View {
        RepositorySearchCell(item: .fixture()) {}
    }
}
