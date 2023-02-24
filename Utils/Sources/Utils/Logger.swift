import Foundation
import os.log

public final class Logger {
    // MARK: - Private properties

    private static let subsystem = "com.skoumal"

    // MARK: - Public properties

    /// Log accessibility level
    ///
    /// - `public`: Log message will be visible in Console app.
    /// - `private`: Log message won't be visible in Console app.
    enum AccessLevel: String {
        case `public`
        case `private`
    }

    /// A category within the specified subsystem. The category is used for categorization and filtering of related log messages.
    enum Category: String, CaseIterable {
        case analytics = "🎯 Analytics"
        case debug = "🔨 Debug"
        case error = "❌ Error"
        case info = "ℹ️ Info"
        case lifeCycle = "🎛️ Life Cycle"
        case request = "🚀 Request"

        /// The values that determine how logs are categorized.
        var type: OSLogType {
            switch self {
            case .analytics, .debug, .lifeCycle, .request:
                return .debug
            case .error:
                return .error
            case .info:
                return .info
            }
        }
    }

    private static var enabled: [Category] {
        #if DEBUG
            return Category.allCases
        #else
            return []
        #endif
    }

    // MARK: - Private functions

    /// A custom log object that can be passed to logging functions in order to send messages to the logging system.
    ///
    /// - Parameters
    ///   - category: The log type category, for example, .debug, .info, .error
    /// - Returns: A custom log object, which can be passed to other logging functions to perform logging and to determine whether a specific level of logging is enabled. A value is always returned.
    private class func osLog(for category: Category) -> OSLog {
        guard Logger.enabled.contains(category) else {
            return OSLog.disabled
        }
        return OSLog(subsystem: Logger.subsystem, category: category.rawValue)
    }

    /// Sends a message at a specific logging level, such as default, info, debug, error, or fault, to the logging system.
    ///
    /// - Parameters
    ///   - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///   - category: The log type category, for example, .debug, .info, .error
    ///   - access: AccessLevel, log access level. Default `private`.
    ///   - fileName: The name of the file in which it appears.
    ///   - functionName: The name of the declaration in which it appears.
    ///   - lineNumber: The line number on which it appears.
    private class func log(_ message: String, access: AccessLevel = .private, category: Category, fileName: String = #file, functionName: String = #function, lineNumber: Int32 = #line) {
        #if DEBUG

            // Log to console
            let file = (fileName as NSString).lastPathComponent
            let line = String(lineNumber)
            let log = Logger.osLog(for: category)

            let messageFormat = "❮%@:%@ %@❯ %@"
            let osLogFormat: StaticString

            switch access {
            case .private:
                osLogFormat = "%{private}@"

            case .public:
                osLogFormat = "%{public}@"
            }

            let message = String(format: messageFormat, file, line, functionName, message)
            os_log(osLogFormat, log: log, type: category.type, message)
        #endif
    }
}

// MARK: - Public functions

extension Logger {
    /// Sends an analytics-level message to the logging system.
    ///
    /// - Parameters
    ///   - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///   - fileName: The name of the file in which it appears.
    ///   - functionName: The name of the declaration in which it appears.
    ///   - lineNumber: The line number on which it appears.
    public class func logAnalytics(_ message: String, fileName: String = #file, functionName: String = #function, lineNumber: Int32 = #line) {
        Logger.log(message, access: .private, category: .analytics, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }

    /// Sends a debug-level message to the logging system.
    ///
    /// - Parameters
    ///   - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///   - fileName: The name of the file in which it appears.
    ///   - functionName: The name of the declaration in which it appears.
    ///   - lineNumber: The line number on which it appears.
    public class func logDebug(_ message: String, fileName: String = #file, functionName: String = #function, lineNumber: Int32 = #line) {
        Logger.log(message, access: .private, category: .debug, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }

    /// Sends an error-level message to the logging system.
    ///
    /// - Parameters
    ///   - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///   - fileName: The name of the file in which it appears.
    ///   - functionName: The name of the declaration in which it appears.
    ///   - lineNumber: The line number on which it appears.
    public class func logError(_ message: String, fileName: String = #file, functionName: String = #function, lineNumber: Int32 = #line) {
        Logger.log(message, access: .private, category: .error, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }

    /// Sends an info-level message to the logging system.
    ///
    /// - Parameters
    ///   - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///   - fileName: The name of the file in which it appears.
    ///   - functionName: The name of the declaration in which it appears.
    ///   - lineNumber: The line number on which it appears.
    public class func logInfo(_ message: String, fileName: String = #file, functionName: String = #function, lineNumber: Int32 = #line) {
        Logger.log(message, access: .private, category: .info, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }

    /// Sends an lifeCycle-level message to the logging system.
    ///
    /// - Parameters
    ///   - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///   - fileName: The name of the file in which it appears.
    ///   - functionName: The name of the declaration in which it appears.
    ///   - lineNumber: The line number on which it appears.
    public class func logLifeCycle(_ message: String, fileName: String = #file, functionName: String = #function, lineNumber: Int32 = #line) {
        Logger.log(message, access: .private, category: .lifeCycle, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }

    /// Sends an reguest-level message to the logging system.
    ///
    /// - Parameters
    ///   - message: The message to be logged. `message` can be used with any string interpolation literal.
    ///   - fileName: The name of the file in which it appears.
    ///   - functionName: The name of the declaration in which it appears.
    ///   - lineNumber: The line number on which it appears.
    public class func logRequest(_ message: String, fileName: String = #file, functionName: String = #function, lineNumber: Int32 = #line) {
        Logger.log(message, access: .private, category: .request, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }
}
