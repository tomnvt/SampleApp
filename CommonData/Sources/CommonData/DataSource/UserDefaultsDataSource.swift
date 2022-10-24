import Foundation

public enum UserDefaultsKey: String, CaseIterable {
    case onboardingShown
}

public class UserDefaultsDataSource {
    public typealias Key = UserDefaultsKey

    public static let shared = UserDefaultsDataSource()

    private let userDefaults = UserDefaults.standard

    public func set<T>(_ key: Key, value: T) {
        userDefaults.set(value, forKey: key.rawValue)
    }

    public func get<T>(_ key: Key) -> T? {
        return userDefaults.object(forKey: key.rawValue) as? T
    }

    public func get<T>(_ key: Key, type: T.Type) -> T? {
        return userDefaults.object(forKey: key.rawValue) as? T
    }

    public func get<T>(_ key: Key, defaultValue: T) -> T {
        return userDefaults.object(forKey: key.rawValue) as? T ?? defaultValue
    }

    public func remove(_ key: Key) {
        userDefaults.removeObject(forKey: key.rawValue)
    }

    public func removeAll() {
        Key.allCases.forEach {
            userDefaults.removeObject(forKey: $0.rawValue)
        }
    }
}
