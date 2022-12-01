struct RequestSpec {
    var baseURL: String
    var path: String
    var queryParams: [String: String]
    var method: HTTPMethod
    var headers: [String: String]
    var params: [String: Any]
}
