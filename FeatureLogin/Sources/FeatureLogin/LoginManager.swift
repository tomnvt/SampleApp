import CommonData
import CommonDomain
import UIKit
import SwiftUI

public struct LoginManager {
    private let navigationController: UINavigationController
    private let delegate: LoginDelegate

    public init(navigationController: UINavigationController, delegate: LoginDelegate) {
        self.navigationController = navigationController
        self.delegate = delegate
    }

    public func start() {
        let view = EmailLoginView(
            viewModel: EmailLoginViewModel(
                loginInteractor: LoginInteractor(
                    loginRepository: LoginRepository.shared,
                    userRepository: UserRepository.shared
                ),
                onEvent: handleEmailLoginEvent
            )
        )
        navigationController.pushView(view)
    }

    public func startBeforeLastScreen() {
        let view = getEmailLoginView()
        navigationController.insertViewControllersBeforeLastScreen([UIHostingController(rootView: view)])
    }

    func getEmailLoginView() -> EmailLoginView {
        return EmailLoginView(
            viewModel: EmailLoginViewModel(
                loginInteractor: LoginInteractor(
                    loginRepository: LoginRepository.shared,
                    userRepository: UserRepository.shared
                ),
                onEvent: handleEmailLoginEvent
            )
        )
    }

    func insertViewControllersBeforeLastScreen(
        _ viewControllers: [UIViewController]
    ) {
        let index = navigationController.viewControllers.count - 1
        navigationController.viewControllers.insert(contentsOf: viewControllers, at: index)
    }

    func handleEmailLoginEvent(_ event: EmailLoginEvent) {
        switch event {
        case .forgottenPasswordTapped:
            showForgottenPasswordScreen()
        case .loginFinished:
            delegate.onLoginFinish()
        }
    }

    func showForgottenPasswordScreen() {
        let view = ForgottenPasswordView(
            viewModel: ForgottenPasswordViewModel(
                onEvent: handleForgottenPasswordEvent,
                loginInteractor: LoginInteractor(
                    loginRepository: LoginRepository.shared,
                    userRepository: UserRepository.shared
                )
            )
        )
        navigationController.pushView(view)
    }

    func handleForgottenPasswordEvent(_ event: ForgottenPasswordEvent) {
        switch event {
        case .passwordResetSucceeded, .backButtonTapped:
            navigationController.popViewController(animated: true)
        }
    }
}
