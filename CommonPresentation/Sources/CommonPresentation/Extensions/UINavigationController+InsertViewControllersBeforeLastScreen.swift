import UIKit

public extension UINavigationController {
    func insertViewControllersBeforeLastScreen(
        _ viewControllers: [UIViewController]
    ) {
        let index = self.viewControllers.count - 1
        self.viewControllers.insert(contentsOf: viewControllers, at: index)
    }
}
