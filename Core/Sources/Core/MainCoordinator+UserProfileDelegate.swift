import FeatureUserProfile
import FeatureLogin

extension MainCoordinator: UserProfileDelegate {
    public func userDidLogOut() {
        LoginManager(dependencies: dependencies.featureLoginDependencies, navigationController: mainNavigationController, delegate: self)
            .startBeforeLastScreen()
        mainNavigationController.popViewController(animated: true)
    }
}
