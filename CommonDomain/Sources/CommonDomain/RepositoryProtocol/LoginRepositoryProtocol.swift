public protocol LoginRepositoryProtocol {
    func login(email: String, password: String) async throws
    func resetPassword(email: String) async throws
    func logout() async throws
}
