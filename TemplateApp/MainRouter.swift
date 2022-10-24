import CommonData
import FeatureOnboarding
import FeatureExample
import FeatureLogin
import FeatureUserProfile
import SwiftUI
import UIKit

class MainRouter {
    var tabsNavigationControllers = [Tab: UINavigationController]()

    let mainNavigationController: UINavigationController

    init(mainNavigationController: UINavigationController) {
        self.mainNavigationController = mainNavigationController
    }

    func start() {
        if UserRepository.shared.isUserLoggedIn() {
            showTabBar()
        } else if UserRepository.shared.onboardingWasShown() {
            showLogin()
        } else {
            showOnboarding()
        }
    }

    func showTabBar() {
        for tab in Tab.allTabs {
            tabsNavigationControllers[tab] = UINavigationController()
        }
        let tabBar = TabBarController(tabsToNavigationControllers: tabsNavigationControllers)
        guard let firstTabNavigationController = tabsNavigationControllers[.tab1],
              let secondTabNavigationController = tabsNavigationControllers[.tab2]
        else { return }
        FeatureExampleManager(navigationController: firstTabNavigationController)
            .start()
        UserProfileManager(navigationController: secondTabNavigationController, delegate: self)
            .start()
        mainNavigationController.pushViewController(tabBar, animated: true)
    }

    func showOnboarding() {
        OnboardingManager(navigationController: mainNavigationController, delegate: self)
            .start()
    }

    func showLogin() {
        LoginManager(navigationController: mainNavigationController, delegate: self)
            .start()
    }
}
