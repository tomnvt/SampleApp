import SwiftUI

public extension UINavigationController {
    func pushView<V: View>(_ view: V, animated: Bool = true) {
        pushViewController(UIHostingController(rootView: view), animated: animated)
    }
}
