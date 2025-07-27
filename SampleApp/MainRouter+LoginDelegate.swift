import FeatureLogin

extension MainRouter: LoginDelegate {
    func onLoginFinish() {
        showTabBar()
    }
}
