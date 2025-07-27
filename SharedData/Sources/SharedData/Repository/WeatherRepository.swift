import SharedDomain

public class WeatherRepository: WeatherRepositoryProtocol {
    private let httpClient: HTTPClientProtocol

    public init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }

    public func getWeather(latitude: Double, longitude: Double) async throws -> Weather {
        let apiResponse = try await httpClient.makeRequest(
            WeatherAPI.getMaxTemperature(latitude: latitude, longitude: longitude),
            modelType: WeatherApiModel.self
        )
        return Weather(hourlyTemperature: apiResponse.hourly.temperature2M)
    }
}
