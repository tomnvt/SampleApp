import CommonData
import SharedDomain

class AppDependencies {
    // MARK: - Data sources
    lazy var keychainDataSource: KeychainDataSource = KeychainDataSource()
    lazy var userDefaultsDataSource: UserDefaultsDataSource = UserDefaultsDataSource()
    lazy var coreDataDataSource: CoreDataDataSource = CoreDataDataSource()
    lazy var httpClient: HTTPClientProtocol = HTTPClient()

    // MARK: - Repositories
    lazy var loginRepository: LoginRepositoryProtocol = LoginRepository(keychainDataSource: keychainDataSource)
    lazy var userRepository: UserRepository = UserRepository(
        userDefaultsDataSource: userDefaultsDataSource,
        keychainDataSource: keychainDataSource
    )
    lazy var geoInfoRepository: GeoInfoRepositoryProtocol = GeoInfoRepository(httpClient: httpClient)
    lazy var weatherRepository: WeatherRepositoryProtocol = WeatherRepository(httpClient: httpClient)

    // MARK: - Interactors
    lazy var loginInteractor: LoginInteractorProtocol = LoginInteractor(
        loginRepository: loginRepository,
        userRepository: userRepository
    )
    lazy var weatherIntector: WeatherInteractorProtocol = WeatherInteractor(
        geoInfoRepository: geoInfoRepository,
        weatherRepository: weatherRepository
    )
}
