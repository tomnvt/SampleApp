import CommonData
import CommonDomain

class AppDependencies {
    // MARK: - Data sources
    lazy var keychainDataSource: KeychainDataSource = KeychainDataSource()
    lazy var userDefaultsDataSource: UserDefaultsDataSource = UserDefaultsDataSource()
    lazy var coreDataDataSource: CoreDataDataSource = CoreDataDataSource()

    // MARK: - Repositories
    lazy var loginRepository: LoginRepositoryProtocol = LoginRepository(keychainDataSource: keychainDataSource)
    lazy var userRepository: UserRepository = UserRepository(
        userDefaultsDataSource: userDefaultsDataSource,
        keychainDataSource: keychainDataSource
    )

    // MARK: - Interactors
    lazy var loginInteractor: LoginInteractorProtocol = LoginInteractor(
        loginRepository: loginRepository,
        userRepository: userRepository
    )
}
