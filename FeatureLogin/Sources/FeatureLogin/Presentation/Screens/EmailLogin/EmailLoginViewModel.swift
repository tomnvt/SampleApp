import SharedDomain
import Foundation
import SwiftUI

final class EmailLoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var emailFieldShakeTrigger = false
    @Published var passwordFieldShakeTrigger = false
    @Published var isLoading = false

    private let loginInteractor: LoginInteractorProtocol
    private let onEvent: (EmailLoginEvent) -> Void

    init(
        loginInteractor: LoginInteractorProtocol,
        onEvent: @escaping (EmailLoginEvent) -> Void
    ) {
        self.loginInteractor = loginInteractor
        self.onEvent = onEvent

        #if DEBUG
        email = "hello@app.com"
        password = "123456"
        #endif
    }
}

// MARK: - Protocol conformance
extension EmailLoginViewModel {

    // MARK: - Actions handling
    func forgotenPasswordTapped() {
        onEvent(.forgottenPasswordTapped)
    }

    func loginTapped() {
        // TODO: Add validation if needed
        if email.isEmpty {
            emailFieldShakeTrigger.toggle()
        }
        if password.isEmpty {
            passwordFieldShakeTrigger.toggle()
        }
        if !email.isEmpty && !password.isEmpty {
            return login()
        }
    }
}

// MARK: - Private
private extension EmailLoginViewModel {

    func login() {
        isLoading = true
        Task {
            do {
                try await loginInteractor.login(email: email, password: password)
                await MainActor.run {
                    sleep(1)
                    isLoading = false
                    onEvent(.loginFinished)
                }
            } catch {
                isLoading = false
                handleLoginError(error: error)
            }
        }
    }

    func handleLoginError(error: Error) {
        UIAlertController.showErrorAlert(error: error, onRetry: login)
    }
}
