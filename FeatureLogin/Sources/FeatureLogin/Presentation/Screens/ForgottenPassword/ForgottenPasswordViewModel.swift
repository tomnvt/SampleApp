import CommonDomain
import SwiftUI

class ForgottenPasswordViewModel: ObservableObject {
    @Published var emailInput: String = ""
    @Published var emailFieldShakeTrigger: Bool = false

    private let onEvent: (ForgottenPasswordEvent) -> Void
    private let loginInteractor: LoginInteractorProtocol

    init(
        onEvent: @escaping (ForgottenPasswordEvent) -> Void,
        loginInteractor: LoginInteractorProtocol
    ) {
        self.onEvent = onEvent
        self.loginInteractor = loginInteractor
    }

    func onBackButtonTapped() {
        onEvent(.backButtonTapped)
    }

    func onResetBtnTap() {
        // TODO: Add validation if needed
        if emailInput.isEmpty {
            emailFieldShakeTrigger.toggle()
        } else {
            resetPassword()
        }
    }

    func resetPassword() {
        Task {
            do {
                try await loginInteractor.resetPassword(email: emailInput)
                await MainActor.run {
                    UIAlertController.show(message: "Check your mail.", confirmTitle: "OK", onConfirm: { [weak self] in
                        self?.onEvent(.passwordResetSucceeded)
                    })
                }
            } catch {
                await UIAlertController.showErrorAlert(error: error, onRetry: onResetBtnTap)
            }
        }
    }
}
