public protocol UserRepositoryProtocol {
    func onboardingWasShown() -> Bool
    func setOnboardingShown()
    func isUserLoggedIn() -> Bool
    func deleteUserData()
    func getUserProfile() async throws -> UserProfile
}
