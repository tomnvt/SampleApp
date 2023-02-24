import CommonData
import FeatureOnboarding

extension MainRouter: OnboardingDelegate {
    func onboardingFinished() {
        dependencies.userRepository.setOnboardingShown()
        showLogin()
    }
}
