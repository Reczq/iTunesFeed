import Foundation

struct Resource<A> {
    let url: URL
    let parse: (Data) -> A?
}

extension Resource where A: Decodable {
    init(url: URL) {
        self.url = url
        self.parse = { try? JSONDecoder().decode(A.self, from: $0)}
    }
}
