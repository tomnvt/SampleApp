import UIKit

public struct UserProfileManager {
    private let dependencies: FeatureUserProfileDependencies
    private let navigationController: UINavigationController
    private let delegate: UserProfileDelegate

    public init(dependencies: FeatureUserProfileDependencies, navigationController: UINavigationController, delegate: UserProfileDelegate) {
        self.dependencies = dependencies
        self.navigationController = navigationController
        self.delegate = delegate
    }

    public func start() {
        let view = UserProfileView(
            viewModel: UserProfileViewModel(
                userRepository: dependencies.userRepository,
                loginInteractor: dependencies.loginInteractor,
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
