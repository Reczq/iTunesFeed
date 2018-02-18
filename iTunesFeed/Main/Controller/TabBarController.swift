import UIKit

final class TabBarController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string:  "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/10/explicit.json")!
        let resource = Resource<MovieModel>(url: url)

        WebService().load(resources: resource) {
            print($0 ?? 0)
        }
    }
}
