import Foundation

public protocol HTTPClientProtocol {
    func makeRequest<T: Codable>(_ requestSpec: RequestSpec, modelType: T.Type) async throws -> T
}

public class HTTPClient: HTTPClientProtocol {
    public init() {}

    public func makeRequest<T: Codable>(_ requestSpec: RequestSpec, modelType: T.Type) async throws -> T {
        let data = try await URLSession.shared.data(for: requestSpec.urlRequest).0
        return try JSONDecoder().decode(modelType, from: data)
    }
}
