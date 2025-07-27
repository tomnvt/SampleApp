import SharedUI
import SwiftUI

struct OnboardingPageConfig {

    let index: Int
    let titleText: String
    let messageText: String
}

// MARK: - Identifiable
extension OnboardingPageConfig: Identifiable {

    var id: Int { index + 1 }
}

// MARK: - Onboarding pages definition
extension OnboardingPageConfig {

    static var page1: Self {
        .init(
            index: 0,
            titleText: L10n.Onboarding.Page1.title,
            messageText: L10n.Onboarding.Page1.message
        )
    }

    static var page2: Self {
        .init(
            index: 1,
            titleText: L10n.Onboarding.Page2.title,
            messageText: L10n.Onboarding.Page2.message
        )
    }

    static var page3: Self {
        .init(
            index: 2,
            titleText: L10n.Onboarding.Page3.title,
            messageText: L10n.Onboarding.Page3.message
        )
    }

    static var page4: Self {
        .init(
            index: 3,
            titleText: L10n.Onboarding.Page4.title,
            messageText: L10n.Onboarding.Page4.message
        )
    }

    static var page5: Self {
        .init(
            index: 4,
            titleText: L10n.Onboarding.Page5.title,
            messageText: L10n.Onboarding.Page5.message
        )
    }

    static var allPages: [OnboardingPageConfig] = [
        .page1,
        .page2,
        .page3,
        .page4,
        .page5,
    ]
}
