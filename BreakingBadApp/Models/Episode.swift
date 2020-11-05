import Foundation

struct Episode: Decodable {
    let id: Int
    let title: String
    let season: String
    let episode: String
    let date: String
    let characters: [String]
    let series: String
    
    enum CodingKeys: String, CodingKey {
        case id = "episode_id"
        case title
        case season
        case episode
        case date = "air_date"
        case characters
        case series
    }
}
