import Foundation

protocol DateMapperProtocol {
    func map(_ stringDate: String) -> Date?
}

struct DateMapper: DateMapperProtocol {
    func map(_ stringDate: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: stringDate)
    }
}
