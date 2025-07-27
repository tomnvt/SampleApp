public struct GeoInfo: Codable {
    public let name: String
    public let latitude, longitude: Double
    public let country, state: String

    public init(name: String, latitude: Double, longitude: Double, country: String, state: String) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.country = country
        self.state = state
    }
}
