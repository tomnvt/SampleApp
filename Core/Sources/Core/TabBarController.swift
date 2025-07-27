import Combine
import UIKit

struct Tab: Hashable {
    let index: Int
    let title: String
    let imageName: String

    static var tab1: Tab {
        Tab(
            index: 0,
            title: "List",
            imageName: "list.clipboard"
        )
    }

    static var tab2: Tab {
        Tab(
            index: 1,
            title: "User",
            imageName: "person.circle"
        )
    }

    static var allTabs: [Tab] {
        [tab1, tab2]
    }
}

class TabBarController: UITabBarController {
    // MARK: - Properties
    private let tabsToNavigationControllers: [Tab: UINavigationController]

    private var cancellables = Set<AnyCancellable>()

    // MARK: - Init
    init(tabsToNavigationControllers: [Tab: UINavigationController]) {
        self.tabsToNavigationControllers = tabsToNavigationControllers

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    func setupTabs() {
        viewControllers = tabsToNavigationControllers.keys
            .map { $0 as Tab }
            .sorted { $0.index < $1.index }
            .compactMap { tab in
                guard let navigationController = tabsToNavigationControllers[tab] else { return nil }
                let tabBarItem = UITabBarItem(title: tab.title, image: UIImage(systemName: tab.imageName), tag: tab.index)
                navigationController.tabBarItem = tabBarItem
                return navigationController
            }

        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        UITabBar.appearance().standardAppearance = tabBarAppearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}
