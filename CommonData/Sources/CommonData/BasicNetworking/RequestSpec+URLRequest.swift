import Foundation

extension RequestSpec {
    var urlRequest: URLRequest {
        let url = URL(string: baseURL)!
            .setPathComponent(path)
            .setUrlParams(queryParams)

        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue

        if method == .post {
            if let contentType = headers["Content-Type"] {
                if contentType.contains("application/x-www-form-urlencoded") {
                    let rawBody = params.reduce(into: "") { (result, keyValuePair) in
                        let (key, value) = keyValuePair
                        result += "\(key)=\(value)&"
                    }
                    request.httpBody = rawBody.data(using: .utf8)
                } else if contentType.contains("text/plain") || contentType.contains("application/json") {
                    request.httpBody = try? JSONSerialization.data(withJSONObject: params)
                }
            }
        }
        return request
    }
}

extension URL {
    func setPathComponent(_ component: String) -> Self {
        self.appendingPathComponent(component)
    }

    func setUrlParams(_ params: [String: String]) -> Self {
        guard !params.isEmpty,
              var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: false) else { return self }
        urlComponents.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        return urlComponents.url ?? self
    }
}
