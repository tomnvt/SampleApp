import FirebaseAnalytics

public class AnalyticsLogger {
    public static func logEvent(_ event: AnalyticEvent) {
        Analytics.logEvent(event.eventName, parameters: event.parameters)
    }
}
