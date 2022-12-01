// GENERATED CODE - DO NOT EDIT

// To change analytic events, change them in https://docs.google.com/spreadsheets/d/1dq_Ur7s-X87U6P7AiL-_-ahFBsZCoUUjVvXNqYt1BYE
// And run generation scripts again.

extension AnalyticEvent {
    public static func itemSelected(
        id: String,
		name: String
    ) -> AnalyticEvent {
        return AnalyticEvent(
            eventName: "item_selected",
            parameters: [
                "id" : id,
				"name" : name
            ]
        )
    }
}

extension AnalyticEvent {
    public static var onboardingFinished: AnalyticEvent {
        return AnalyticEvent(
            eventName: "onboarding_finished",
            parameters: [:]
        )
    }
}

extension AnalyticEvent {
    public static func onboardingSkipped(
        pageNumber: Int
    ) -> AnalyticEvent {
        return AnalyticEvent(
            eventName: "onboarding_skipped",
            parameters: [
                "page_number" : pageNumber
            ]
        )
    }
}
