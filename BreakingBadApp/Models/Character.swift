import Foundation

struct Character: Decodable, Identifiable {
    let id: Int
    let name: String
    let birthday: String
    let occupation: [String]
    let imageUrl: String
    let status: String
    let nickname: String
    let appearance: [Int]?
    let portrayed: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case id = "char_id"
        case name
        case birthday
        case occupation
        case imageUrl = "img"
        case status
        case nickname
        case appearance
        case portrayed
        case category
    }
}
