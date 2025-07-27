import FeatureLogin

extension MainCoordinator: LoginDelegate {
    public func onLoginFinish() {
        showTabBar()
    }
}
