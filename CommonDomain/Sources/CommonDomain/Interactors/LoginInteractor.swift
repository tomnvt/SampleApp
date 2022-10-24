public protocol LoginInteractorProtocol {
    func login(email: String, password: String) async throws
    func resetPassword(email: String) async throws
    func logout() async throws
}

public class LoginInteractor {
    private let loginRepository: LoginRepositoryProtocol
    private let userRepository: UserRepositoryProtocol

    public init(
        loginRepository: LoginRepositoryProtocol,
        userRepository: UserRepositoryProtocol
    ) {
        self.loginRepository = loginRepository
        self.userRepository = userRepository
    }
}

extension LoginInteractor: LoginInteractorProtocol {
    public func login(email: String, password: String) async throws {
        try await loginRepository.login(email: email, password: password)
    }

    public func resetPassword(email: String) async throws {
        try await loginRepository.resetPassword(email: email)
    }

    public func logout() async throws {
        userRepository.deleteUserData()
        try await loginRepository.logout()
    }
}
