import Foundation

public struct GitRepoDetailsModel: Equatable {
    public let information: GitRepoInformationModel
    public let tags: [String]
    public let contributors: [GitRepoUserModel]

    public init(information: GitRepoInformationModel, tags: [String], contributors: [GitRepoUserModel]) {
        self.information = information
        self.tags = tags
        self.contributors = contributors
    }
}
