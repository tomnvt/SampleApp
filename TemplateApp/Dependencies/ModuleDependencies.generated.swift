// Generated using Sourcery 1.9.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import FeatureExample 

extension AppDependencies {
    var featureExampleDependencies: FeatureExampleDependencies {
        FeatureExampleDependencies(
            coreDataDataSource: coreDataDataSource
        )
    }
}


import FeatureLogin 

extension AppDependencies {
    var featureLoginDependencies: FeatureLoginDependencies {
        FeatureLoginDependencies(
            loginInteractor: loginInteractor
        )
    }
}


import FeatureUserProfile 

extension AppDependencies {
    var featureUserProfileDependencies: FeatureUserProfileDependencies {
        FeatureUserProfileDependencies(
            userRepository: userRepository,
            loginInteractor: loginInteractor
        )
    }
}


