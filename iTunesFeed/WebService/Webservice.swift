import Foundation

final class WebService {
    func load<A>(resources: Resource<A>, completion: @escaping (A?) -> ()) {
        URLSession.shared.dataTask(with: resources.url) { (data, response, error) in
            let result = data.flatMap(resources.parse)

            DispatchQueue.main.async {
                completion(result)
            }
        }.resume()
    }
}
