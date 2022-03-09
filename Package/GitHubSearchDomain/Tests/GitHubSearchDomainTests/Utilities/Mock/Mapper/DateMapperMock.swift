import Foundation
import GitHubSearchData
@testable import GitHubSearchDomain

struct DateMapperMock: DateMapperProtocol {
    func map(_ stringDate: String) -> Date? {
        .fixture()
    }
}
