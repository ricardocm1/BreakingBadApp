import Foundation

protocol URLProvider {
    var url: URL? { get }
}

// MARK: - fixed urls
struct FullURLSpecified: URLProvider {
    let url: URL?

    init(path: String) {
        self.url = URL(string: path)
    }
}

// MARK: - endpoints
let baseAPIUrl = "https://www.breakingbadapi.com/api"

struct SearchAPIURLProvider: URLProvider {
    let url: URL?

    init(endpoint: Endpoint) {
        url = Self.buildURL(with: endpoint)
    }

    static func buildURL(with endpoint: Endpoint) -> URL? {
        let baseUrl = "\(baseAPIUrl)/\(endpoint.url)"
        
        guard let url = URL(string: baseUrl) else {
            return nil
        }

        return url
    }
    
    enum Endpoint {
        case character(id: Int)
        case characters
        case episode(id: Int)
        case episodes
        case quote(id: Int)
        case quotes
        case death(id: Int)
        case deaths
        
        var url: String {
            switch self {
            case .character(let id):
                return "characters/\(id)"
            case .episode(let id):
                return "episodes/\(id)"
            case .quote(let id):
                return "quotes/\(id)"
            case .death(let id):
                return "deaths/\(id)"
            default:
                return "\(self)"
            }
        }
    }
}
