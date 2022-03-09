import Foundation
import Combine

extension Publisher {

    func sink(
        onValue: ((Self.Output) -> Void)? = nil,
        onFailure: ((Failure) -> Void)? = nil,
        onFinish: (() -> Void)? = nil
    ) -> AnyCancellable {
        sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                onFinish?()
            case .failure(let error):
                onFailure?(error)
            }
        }, receiveValue: { output in
            onValue?(output)
        })
    }

}
