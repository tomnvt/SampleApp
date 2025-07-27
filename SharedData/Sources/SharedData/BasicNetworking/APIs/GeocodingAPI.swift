struct GeocodingAPI: RequestSpec {
    var baseURL: String = "https://api.api-ninjas.com"
    var path: String = ""
    var queryParams: [String: String] = [:]
    var method: HTTPMethod = .get
    var headers: [String: String] = [
        "X-Api-Key": "F/BgeX03AcfAl1EgXNXq0Q==QiXWBMClblJ3mbol"
    ]
    var params: [String: Any] = [:]
}

extension GeocodingAPI {
    static func getGeocoding(city: String, country: String?) -> GeocodingAPI {
        GeocodingAPI(
            path: "/v1/geocoding",
            queryParams: [
                "city": city
            ]
        )
    }
}
