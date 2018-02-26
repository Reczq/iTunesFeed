import UIKit

final class MoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var movies: [ResultsModel]? = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
    }


    private func fetchData() {
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/2/explicit.json")!
        let resource = Resource<MovieModel>(url: url)

        WebService().load(resources: resource) { [weak self] in
            if let movieData = $0?.feed.results {
                self?.movies = movieData
            }
        }
    }
}

extension MoviesViewController: UITableViewDelegate {

}

extension MoviesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)



        return cell
    }
}
