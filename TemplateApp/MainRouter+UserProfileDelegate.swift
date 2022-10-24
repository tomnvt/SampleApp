import FeatureUserProfile
import FeatureLogin

extension MainRouter: UserProfileDelegate {
    func userDidLogOut() {
        LoginManager(navigationController: mainNavigationController, delegate: self)
            .startBeforeLastScreen()
        mainNavigationController.popViewController(animated: true)
    }
}
