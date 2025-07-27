struct WeatherAPI: RequestSpec {
    var baseURL: String = "https://api.open-meteo.com"
    var path: String = "/v1/forecast"
    var queryParams: [String: String] = [:]
    var method: HTTPMethod = .get
    var headers: [String: String] = [:]
    var params: [String: Any] = [:]
}

extension WeatherAPI {
    static func getMaxTemperature(latitude: Double, longitude: Double) -> WeatherAPI {
        WeatherAPI(
            queryParams: [
                "latitude": "\(latitude)",
                "longitude": "\(longitude)",
                "hourly": "temperature_2m"
            ]
        )
    }
}
