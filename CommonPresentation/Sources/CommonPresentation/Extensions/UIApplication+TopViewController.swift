import UIKit

public extension UIApplication {
    static func topViewController(base: UIViewController? = nil) -> UIViewController? {
        let baseViewController = base ??
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.rootViewController

        if let nav = baseViewController as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        } else if let tab = baseViewController as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        } else if let presented = baseViewController?.presentedViewController {
            return topViewController(base: presented)
        }
        return baseViewController
    }
}
