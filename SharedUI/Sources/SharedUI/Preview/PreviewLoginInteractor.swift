import SharedDomain

public class PreviewLoginInteractor: LoginInteractorProtocol {
    public func login(email: String, password: String) async throws {}
    public func resetPassword(email: String) async throws {}
    public func logout() async throws {}

    public init() {}
}
