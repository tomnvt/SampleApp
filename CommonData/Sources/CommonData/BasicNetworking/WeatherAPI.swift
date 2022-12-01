extension RequestSpec {
    static func getMaxTemperature() -> RequestSpec {
        RequestSpec(
            baseURL: "https://api.open-meteo.com/v1/forecast",
            path: "",
            queryParams: [
                "latitude": "50.48",
                "longitude": "16.18",
                "hourly": "temperature_2m"
            ],
            method: .get,
            headers: [:],
            params: [:]
        )
    }
}
