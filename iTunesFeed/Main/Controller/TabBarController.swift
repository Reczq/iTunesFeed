import UIKit

enum MainTabBarItemTags: Int {
    case Movies = 1, iTunesMusic, Books
}

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 0:
            print("movies")
        case 1:
            print("music")
        case 2:
            print("books")
        default: break
        }
    }
}
