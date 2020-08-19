import Foundation

extension Date {
    func string() -> String {
        let dateFormatter  = DateFormatter()
        dateFormatter.dateFormat = "dd/MM HH'h'"
        let formattedDate = dateFormatter.string(from: self)

        return formattedDate
    }
}
