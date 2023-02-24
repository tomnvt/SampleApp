import XCTest
@testable import CommonDomain

final class WeatherInteractorTests: XCTestCase {
    let sut = WeatherInteractor(
        geoInfoRepository: MockGeoInfoRepository(),
        weatherRepository: MockWeatherRepository()
    )

    func test() async throws {
        let result = try await sut.getWeather(city: TestConstants.brno, country: nil)
        XCTAssertEqual(result.hourlyTemperature, [1, 2, 3, 4])
    }
}

class MockGeoInfoRepository: GeoInfoRepositoryProtocol {
    func getGeoInfo(city: String, country: String?) async throws -> GeoInfo {
        if city == TestConstants.brno {
            return GeoInfo(
                name: TestConstants.brno,
                latitude: TestConstants.brnoLatitude,
                longitude: TestConstants.brnoLongitude,
                country: "Moravia",
                state: "Czechia"
            )
        } else {
            throw WeatherInteractorError.geoInfoNotFound
        }
    }
}

class MockWeatherRepository: WeatherRepositoryProtocol {
    func getWeather(latitude: Double, longitude: Double) async throws -> Weather {
        if latitude == TestConstants.brnoLatitude && longitude == TestConstants.brnoLongitude {
            return Weather(hourlyTemperature: [1, 2, 3, 4])
        } else {
            throw WeatherInteractorError.weatherNotFound
        }
    }
}

class TestConstants {
    static let brno = "Brno"
    static let brnoLatitude = 49.195061
    static let brnoLongitude = 16.606836
}
