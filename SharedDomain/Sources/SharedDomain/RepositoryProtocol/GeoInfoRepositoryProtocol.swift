public protocol GeoInfoRepositoryProtocol {
    func getGeoInfo(city: String, country: String?) async throws -> GeoInfo
}
