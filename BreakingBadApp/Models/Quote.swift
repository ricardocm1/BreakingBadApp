import Foundation

struct Quote: Decodable {
    let id: Int
    let quote: String
    let author: String
    let series: String
    
    enum CodingKeys: String, CodingKey {
        case id = "quote_id"
        case quote
        case author
        case series
    }
}
