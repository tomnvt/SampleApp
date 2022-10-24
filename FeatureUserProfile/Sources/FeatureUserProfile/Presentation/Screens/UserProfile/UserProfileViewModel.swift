import CommonDomain
import SwiftUI

class UserProfileViewModel: ObservableObject {
    @Published var userProfile: UserProfile?

    private let userRepository: UserRepositoryProtocol
    private let loginInteractor: LoginInteractorProtocol
    private let onEvent: (UserProfileEvent) -> Void

    init(
        userRepository: UserRepositoryProtocol,
        loginInteractor: LoginInteractorProtocol,
        onEvent: @escaping (UserProfileEvent) -> Void
    ) {
        self.userRepository = userRepository
        self.loginInteractor = loginInteractor
        self.onEvent = onEvent
        loadData()
    }

    func loadData() {
        Task {
            do {
                let userProfile = try await userRepository.getUserProfile()
                self.userProfile = userProfile
            } catch {
                await UIAlertController.showErrorAlert(error: error, onRetry: loadData)
            }
        }
    }

    func onDeleteAccountButtonTap() {
        UIAlertController.show(
            message: "Your account will be deleted shortly.",
            confirmTitle: "Finally",
            onConfirm: { [weak self] in
                self?.logout()
            }
        )
    }

    func onLogoutButtonTap() {
        logout()
    }

    func logout() {
        Task {
            do {
                try await loginInteractor.logout()
                await MainActor.run {
                    onEvent(.userDidLogOut)
                }
            } catch {
                await UIAlertController.showErrorAlert(error: error, onRetry: logout)
            }
        }
    }
}
