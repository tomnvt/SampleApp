import Foundation
import KeychainAccess

public enum KeychainKey: String, CaseIterable {
    case accessToken
    case refreshToken
}

public class KeychainDataSource {
    public typealias Key = KeychainKey

    public init() {}

    private let keychain = Keychain()

    public func set(_ key: Key, value: String) {
        keychain[key.rawValue] = value
    }

    public func get(_ key: Key) -> String? {
        return keychain[key.rawValue]
    }

    public func remove(_ key: Key) throws {
        try keychain.remove(key.rawValue)
    }

    public func removeAll() throws {
        try Key.allCases.forEach {
            try keychain.remove($0.rawValue)
        }
    }
}
