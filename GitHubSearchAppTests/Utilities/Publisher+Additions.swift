import Foundation
import Quick
import Nimble
import Combine

extension Publisher {
    
    func record(to array: UnsafeMutablePointer<[Output]>) -> AnyCancellable {
        sink { completion in
            switch completion {
            case .failure:
                fail()
            case .finished:
                break
            }
        } receiveValue: { output in
            array.pointee.append(output)
        }
    }
    
    func recorded(_ value: UnsafeMutablePointer<Output?>) -> AnyCancellable {
        sink { completion in
            switch completion {
            case .failure:
                fail()
            case .finished:
                break
            }
        } receiveValue: { output in
            value.pointee = output
        }
    }
    
    func recorded(error: UnsafeMutablePointer<Failure?>) -> AnyCancellable {
        sink { completion in
            switch completion {
            case .failure(let failure):
                error.pointee = failure
            case .finished:
                break
            }
        } receiveValue: { _ in
            fail()
        }
    }

}
