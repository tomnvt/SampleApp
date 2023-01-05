public enum WeatherInteractorError: Error {
    case geoInfoNotFound
    case weatherNotFound
}

public protocol WeatherInteractorProtocol {
    func getWeather(city: String, country: String?) async throws -> Weather
}

public class WeatherInteractor: WeatherInteractorProtocol {
    private let geoInfoRepository: GeoInfoRepositoryProtocol
    private let weatherRepository: WeatherRepositoryProtocol

    public init(
        geoInfoRepository: GeoInfoRepositoryProtocol,
        weatherRepository: WeatherRepositoryProtocol
    ) {
        self.geoInfoRepository = geoInfoRepository
        self.weatherRepository = weatherRepository
    }

    public func getWeather(city: String, country: String?) async throws -> Weather {
        let geoInfo = try await geoInfoRepository.getGeoInfo(city: city, country: country)
        return try await weatherRepository.getWeather(latitude: geoInfo.latitude, longitude: geoInfo.longitude)
    }
}
