import SharedDomain

public class GeoInfoRepository: GeoInfoRepositoryProtocol {
    private let httpClient: HTTPClientProtocol

    public init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }

    public func getGeoInfo(city: String, country: String?) async throws -> GeoInfo {
        let apiResponse = try await httpClient.makeRequest(
            GeocodingAPI.getGeocoding(city: city, country: country),
            modelType: [GeoInfoApiModel].self
        )
        guard let firstEntry = apiResponse.first else { throw WeatherInteractorError.geoInfoNotFound }
        return GeoInfo(
            name: firstEntry.name,
            latitude: firstEntry.latitude,
            longitude: firstEntry.longitude,
            country: firstEntry.country,
            state: firstEntry.state
        )
    }
}
