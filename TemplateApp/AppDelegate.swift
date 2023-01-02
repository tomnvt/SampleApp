import Firebase
import SwiftUI
import Utils

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let dependencies = AppDependencies()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        guard let windowScene = (application.connectedScenes.first as? UIWindowScene) else { return true }

        setupFirebase()

        let navigationController = UINavigationController()
        let window = UIWindow(windowScene: windowScene)
        let mainRouter = MainRouter(
            dependencies: dependencies,
            mainNavigationController: navigationController
        )

        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()

        mainRouter.start()
        return true
    }

    func setupFirebase() {
        FirebaseApp.configure()
        AnalyticsLogger.shared = AnalyticsLogger({ name, parameters in
            Analytics.logEvent(name, parameters: parameters)
        })
    }
}
