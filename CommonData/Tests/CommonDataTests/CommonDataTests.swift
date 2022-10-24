import XCTest
@testable import CommonData

final class CommonDataTests: XCTestCase {
    func test_RandomRequest() async throws {
        let urlString = "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m"
        let url = URL(string: urlString)!
        let urlRequest = URLRequest(url: url)
        let data = try await URLSession.shared.data(for: urlRequest).0
        let model = try JSONDecoder().decode(Weather.self, from: data)
        XCTAssertEqual(model.hourly.temperature2M.count, model.hourly.time.count)
    }
}
