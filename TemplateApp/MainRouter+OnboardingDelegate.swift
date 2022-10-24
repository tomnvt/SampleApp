import CommonData
import FeatureOnboarding

extension MainRouter: OnboardingDelegate {
    func onboardingFinished() {
        UserRepository.shared.setOnboardingShown()
        showLogin()
    }
}
