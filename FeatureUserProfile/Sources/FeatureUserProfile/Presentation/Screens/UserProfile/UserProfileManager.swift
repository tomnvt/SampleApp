import CommonData
import CommonDomain
import CommonPresentation
import UIKit

public struct UserProfileManager {
    private let navigationController: UINavigationController
    private let delegate: UserProfileDelegate

    public init(navigationController: UINavigationController, delegate: UserProfileDelegate) {
        self.navigationController = navigationController
        self.delegate = delegate
    }

    public func start() {
        let view = UserProfileView(
            viewModel: UserProfileViewModel(
                userRepository: UserRepository.shared,
                loginInteractor: LoginInteractor(
                    loginRepository: LoginRepository.shared,
                    userRepository: UserRepository.shared
                ),
                onEvent: handleUserProfileEvent
            )
        )
        navigationController.pushView(view)
    }

    func handleUserProfileEvent(_ event: UserProfileEvent) {
        switch event {
        case .userDidLogOut:
            delegate.userDidLogOut()
        }
    }
}
