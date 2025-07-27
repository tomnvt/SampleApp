import FeatureUserProfile
import FeatureLogin

extension MainRouter: UserProfileDelegate {
    func userDidLogOut() {
        LoginManager(dependencies: dependencies.featureLoginDependencies, navigationController: mainNavigationController, delegate: self)
            .startBeforeLastScreen()
        mainNavigationController.popViewController(animated: true)
    }
}
