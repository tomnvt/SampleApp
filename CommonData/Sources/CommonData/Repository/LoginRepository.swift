import CommonDomain

public class LoginRepository {
    private let keychainDataSource: KeychainDataSource

    public init(keychainDataSource: KeychainDataSource) {
        self.keychainDataSource = keychainDataSource
    }
}

extension LoginRepository: LoginRepositoryProtocol {
    public func login(email: String, password: String) async throws {
        // TODO: Implement real login
        keychainDataSource.set(.accessToken, value: "FAKE_ACCESS_TOKEN")
        keychainDataSource.set(.refreshToken, value: "FAKE_REFRESH_TOKEN")
    }

    public func resetPassword(email: String) async throws {
        // TODO: Implement real password reset
    }

    public func logout() async throws {
        try keychainDataSource.remove(.accessToken)
        try keychainDataSource.remove(.refreshToken)
    }
}
