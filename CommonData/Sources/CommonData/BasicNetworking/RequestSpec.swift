public protocol RequestSpec {
    var baseURL: String { get }
    var path: String { get }
    var queryParams: [String: String] { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var params: [String: Any] { get }
}
