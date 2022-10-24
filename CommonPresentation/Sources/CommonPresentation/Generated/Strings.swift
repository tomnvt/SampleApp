// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {
  public enum Alert {
    public enum General {
      /// Cancel
      public static let cancel = L10n.tr("Localizable", "alert.general.cancel", fallback: "Cancel")
      /// Error
      public static let error = L10n.tr("Localizable", "alert.general.error", fallback: "Error")
      /// The following error has occured: %@
      public static func errorMessage(_ p1: Any) -> String {
        return L10n.tr("Localizable", "alert.general.errorMessage", String(describing: p1), fallback: "The following error has occured: %@")
      }
      /// Retry
      public static let retry = L10n.tr("Localizable", "alert.general.retry", fallback: "Retry")
    }
  }
  public enum General {
    /// E-mail
    public static let email = L10n.tr("Localizable", "general.email", fallback: "E-mail")
    /// Enter your e-mail
    public static let enterEmail = L10n.tr("Localizable", "general.enterEmail", fallback: "Enter your e-mail")
    /// Forgotten password
    public static let forgottenPassword = L10n.tr("Localizable", "general.forgottenPassword", fallback: "Forgotten password")
    /// Password
    public static let password = L10n.tr("Localizable", "general.password", fallback: "Password")
    /// Sign in
    public static let signIn = L10n.tr("Localizable", "general.signIn", fallback: "Sign in")
  }
  public enum List {
    /// Add item
    public static let addItem = L10n.tr("Localizable", "list.addItem", fallback: "Add item")
    /// Delete
    public static let delete = L10n.tr("Localizable", "list.delete", fallback: "Delete")
    /// This is a detail for %@
    public static func detailText(_ p1: Any) -> String {
      return L10n.tr("Localizable", "list.detailText", String(describing: p1), fallback: "This is a detail for %@")
    }
  }
  public enum Onboarding {
    public enum Page1 {
      /// First onboarding page
      public static let message = L10n.tr("Localizable", "onboarding.page1.message", fallback: "First onboarding page")
      /// First onboarding page
      public static let title = L10n.tr("Localizable", "onboarding.page1.title", fallback: "First onboarding page")
    }
    public enum Page2 {
      /// This is the second onboarding page! And some more text
      public static let message = L10n.tr("Localizable", "onboarding.page2.message", fallback: "This is the second onboarding page! And some more text")
      /// Second onboarding page
      public static let title = L10n.tr("Localizable", "onboarding.page2.title", fallback: "Second onboarding page")
    }
    public enum Page3 {
      /// This is the third onboarding page! And some even more and more and more text
      public static let message = L10n.tr("Localizable", "onboarding.page3.message", fallback: "This is the third onboarding page! And some even more and more and more text")
      /// Third onboarding page
      public static let title = L10n.tr("Localizable", "onboarding.page3.title", fallback: "Third onboarding page")
    }
    public enum Page4 {
      /// This is the fourth onboarding page! And some even more and more and more and moreeeeeee text
      public static let message = L10n.tr("Localizable", "onboarding.page4.message", fallback: "This is the fourth onboarding page! And some even more and more and more and moreeeeeee text")
      /// Fourth onboarding page
      public static let title = L10n.tr("Localizable", "onboarding.page4.title", fallback: "Fourth onboarding page")
    }
    public enum Page5 {
      /// This is the fifth onboarding page! Not much text in here indeed
      public static let message = L10n.tr("Localizable", "onboarding.page5.message", fallback: "This is the fifth onboarding page! Not much text in here indeed")
      /// Fifth onboarding page
      public static let title = L10n.tr("Localizable", "onboarding.page5.title", fallback: "Fifth onboarding page")
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
