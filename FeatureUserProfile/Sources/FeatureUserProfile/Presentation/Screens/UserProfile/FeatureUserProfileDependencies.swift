import CommonDomain

// sourcery: ModuleDependencies
public class FeatureUserProfileDependencies {
    let userRepository: UserRepositoryProtocol
    let loginInteractor: LoginInteractorProtocol

    public init(userRepository: UserRepositoryProtocol, loginInteractor: LoginInteractorProtocol) {
        self.userRepository = userRepository
        self.loginInteractor = loginInteractor
    }
}
