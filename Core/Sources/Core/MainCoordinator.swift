import SharedData
import FeatureOnboarding
import FeatureExample
import FeatureLogin
import FeatureUserProfile
import SwiftUI
import UIKit

public class MainCoordinator {
    var tabsNavigationControllers = [Tab: UINavigationController]()

    let dependencies = AppDependencies()
    let mainNavigationController: UINavigationController

    public init(mainNavigationController: UINavigationController) {
        self.mainNavigationController = mainNavigationController
    }

    public func start() {
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
