import CommonDomain

public class UserRepository {
    let userDefaultsDataSource = UserDefaultsDataSource.shared
    let keychainDataSource = KeychainDataSource.shared

    public static let shared = UserRepository()
}

extension UserRepository: UserRepositoryProtocol {
    public func onboardingWasShown() -> Bool {
        return userDefaultsDataSource.get(.onboardingShown) ?? false
    }

    public func setOnboardingShown() {
        userDefaultsDataSource.set(.onboardingShown, value: true)
    }

    public func isUserLoggedIn() -> Bool {
        return keychainDataSource.get(.accessToken) != nil
        && keychainDataSource.get(.refreshToken) != nil
    }

    public func getUserProfile() async throws -> UserProfile {
        // TODO: Implement getting user profile
        return UserProfile(
            photoURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTlgckJKuKPLPXykG5eBuRqTCMds9uWCMSOhg&usqp=CAU",
            userName: "Mr. Burns",
            email: "smithers@burns.com"
        )
    }

    public func deleteUserData() {
        // TODO: Implement user data deletion
        print("User data deleted")
    }
}
