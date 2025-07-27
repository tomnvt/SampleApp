import CommonData
import FeatureOnboarding
import FeatureExample
import FeatureLogin
import FeatureUserProfile
import SwiftUI
import UIKit

class MainRouter {
    var tabsNavigationControllers = [Tab: UINavigationController]()

    let dependencies: AppDependencies
    let mainNavigationController: UINavigationController

    init(dependencies: AppDependencies, mainNavigationController: UINavigationController) {
        self.dependencies = dependencies
        self.mainNavigationController = mainNavigationController
    }

    func start() {
        if dependencies.userRepository.isUserLoggedIn() {
            showTabBar()
        } else if dependencies.userRepository.onboardingWasShown() {
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
        FeatureExampleManager(dependencies: dependencies.featureExampleDependencies, navigationController: firstTabNavigationController)
            .start()
        UserProfileManager(dependencies: dependencies.featureUserProfileDependencies, navigationController: secondTabNavigationController, delegate: self)
            .start()
        mainNavigationController.pushViewController(tabBar, animated: true)
    }

    func showOnboarding() {
        OnboardingManager(navigationController: mainNavigationController, delegate: self)
            .start()
    }

    func showLogin() {
        LoginManager(dependencies: dependencies.featureLoginDependencies, navigationController: mainNavigationController, delegate: self)
            .start()
    }
}
