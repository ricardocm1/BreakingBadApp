import Foundation

struct Death: Decodable, Identifiable {
    let id: Int
    let death: String
    let cause: String
    let responsible: String
    let lastWords: String
    let season: Int
    let episode: Int
    let numberOfDeaths: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "death_id"
        case death
        case cause
        case responsible
        case lastWords = "last_words"
        case season
        case episode
        case numberOfDeaths = "number_of_deaths"
    }
}
