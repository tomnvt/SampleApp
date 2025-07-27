import SharedDomain

// sourcery: ModuleDependencies
public class FeatureLoginDependencies {
    public let loginInteractor: LoginInteractorProtocol

    public init(loginInteractor: LoginInteractorProtocol) {
        self.loginInteractor = loginInteractor
    }
}
