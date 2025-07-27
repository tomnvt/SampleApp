struct GeoInfoApiModel: Codable {
    let name: String
    let latitude, longitude: Double
    let country, state: String
}
