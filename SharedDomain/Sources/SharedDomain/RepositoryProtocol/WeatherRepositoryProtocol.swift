public protocol WeatherRepositoryProtocol {
    func getWeather(latitude: Double, longitude: Double) async throws -> Weather
}
