import CommonPresentation
import Utils
import UIKit
import SwiftUI

public struct OnboardingManager {
    private let navigationController: UINavigationController
    private let delegate: OnboardingDelegate

    public init(navigationController: UINavigationController, delegate: OnboardingDelegate) {
        self.navigationController = navigationController
        self.delegate = delegate
    }

    public func start() {
        let view = OnboardingView(onEvent: { event in
            switch event {
            case .skipButtonTapped(let pageNumber):
                AnalyticsLogger.logEvent(.onboardingSkipped(pageNumber: pageNumber))
                delegate.onboardingFinished()
            case .startButtonTapped:
                AnalyticsLogger.logEvent(.onboardingFinished)
                delegate.onboardingFinished()
            }
        })
        navigationController.pushView(view, animated: false)
    }
}
