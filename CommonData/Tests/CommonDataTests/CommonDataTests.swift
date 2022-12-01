import XCTest
@testable import CommonData

final class CommonDataTests: XCTestCase {
    func test_RandomRequest() async throws {
        let request = RequestSpec.getMaxTemperature()
        let data = try await URLSession.shared.data(for: request.urlRequest).0
        let model = try JSONDecoder().decode(Weather.self, from: data)
        XCTAssertEqual(model.hourly.temperature2M.count, model.hourly.time.count)
    }
}
