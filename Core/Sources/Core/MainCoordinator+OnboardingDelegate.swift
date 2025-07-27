import SharedData
import FeatureOnboarding

extension MainCoordinator: OnboardingDelegate {
    public func onboardingFinished() {
        dependencies.userRepository.setOnboardingShown()
        showLogin()
    }
}
