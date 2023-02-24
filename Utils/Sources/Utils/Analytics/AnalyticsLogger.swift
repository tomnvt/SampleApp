public class AnalyticsLogger {
    private let logEventHandler: ((_ name: String, _ parameters: [String: Any]?) -> Void)?

    public init(_ logEventHandler: ((_ name: String, _ parameters: [String: Any]?) -> Void)?) {
        self.logEventHandler = logEventHandler
    }

    public static var shared: AnalyticsLogger?

    public static func logEvent(_ event: AnalyticEvent) {
        Logger.logAnalytics("\(event.eventName): parameters: \(String(describing: event.parameters))")
        shared?.logEventHandler?(event.eventName, event.parameters)
    }
}
