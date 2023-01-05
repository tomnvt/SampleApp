public struct Weather {
    public let hourlyTemperature: [Double]

    public init(hourlyTemperature: [Double]) {
        self.hourlyTemperature = hourlyTemperature
    }
}
