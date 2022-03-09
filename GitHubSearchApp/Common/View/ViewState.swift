import Foundation

enum ViewState<Content> {
    case loading
    case content(Content)
    case empty(String)
    case idle
}

extension ViewState: Equatable where Content: Equatable {}
