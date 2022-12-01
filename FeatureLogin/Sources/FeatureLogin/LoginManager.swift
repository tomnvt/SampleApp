import UIKit
import SwiftUI

public struct LoginManager {
    private let dependencies: FeatureLoginDependencies
    private let navigationController: UINavigationController
    private let delegate: LoginDelegate

    public init(dependencies: FeatureLoginDependencies, navigationController: UINavigationController, delegate: LoginDelegate) {
        self.dependencies = dependencies
        self.navigationController = navigationController
        self.delegate = delegate
    }

    public func start() {
        let view = EmailLoginView(
            viewModel: EmailLoginViewModel(
                loginInteractor: dependencies.loginInteractor,
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
                loginInteractor: dependencies.loginInteractor,
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
                loginInteractor: dependencies.loginInteractor
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
