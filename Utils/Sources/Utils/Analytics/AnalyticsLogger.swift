import FirebaseAnalytics

public class AnalyticsLogger {
    public static func logEvent(_ event: AnalyticEvent) {
        Logger.logAnalytics("\(event.eventName): parameters: \(String(describing: event.parameters))")
        Analytics.logEvent(event.eventName, parameters: event.parameters)
    }
}
