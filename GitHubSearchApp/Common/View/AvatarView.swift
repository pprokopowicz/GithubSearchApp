import SwiftUI

struct AvatarView: View {
    
    // MARK: - Property
    
    private let url: URL?
    
    // MARK: - Init
    
    init(url: URL?) {
        self.url = url
    }
    
    // MARK: - View
    
    var body: some View {
        if let url = url {
            avatar(url: url)
        } else {
            emptyAvatar()
        }
    }
    
    @ViewBuilder
    private func avatar(url: URL) -> some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .background(Color.gray)
                .clipShape(Circle())
        } placeholder: {
            ProgressView()
        }
    }
    
    @ViewBuilder
    private func emptyAvatar() -> some View {
            Image("EmptyAvatar")
                .resizable()
                .background(Color.gray)
                .clipShape(Circle())
    }
}

// MARK: - PreviewProvider

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(url: URL(string: "https://avatars.githubusercontent.com/u/17364220?v=4")!)
    }
}
