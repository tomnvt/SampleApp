import XCTest
@testable import CommonData

final class CommonDataTests: XCTestCase {
    func test_WeatherAPI() async throws {
        let request = WeatherAPI.getMaxTemperature(latitude: 50.48, longitude: 16.18)
        let data = try await URLSession.shared.data(for: request.urlRequest).0
        let model = try JSONDecoder().decode(WeatherApiModel.self, from: data)
        XCTAssertEqual(model.hourly.temperature2M.count, model.hourly.time.count)
    }

    func test_GeocodingAPI() async throws {
        let request = GeocodingAPI()
        let data = try await URLSession.shared.data(for: request.urlRequest).0
        let model = try JSONDecoder().decode([GeoInfoApiModel].self, from: data)
        XCTAssertFalse(model.isEmpty)
    }
}
