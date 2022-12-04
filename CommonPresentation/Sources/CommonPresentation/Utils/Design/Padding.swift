import UIKit
import SwiftUI

// MARK: - Padding Type Protocol
private protocol SpacingType {
    static var x0p5: Self { get }
    static var x1: Self { get }
    static var x1p5: Self { get }
    static var x2: Self { get }
    static var x3: Self { get }
    static var x4: Self { get }
    static var x5: Self { get }
    static var x6: Self { get }
    static var x7: Self { get }
    static var x8: Self { get }
    static var x9: Self { get }
    static var x10: Self { get }

    var rawValue: Int { get }
}

// MARK: - Generic spacing
public enum Padding: SpacingType {
    /// 2 (iPhone)
    case x0p5
    /// 4 (iPhone)
    case x1
    /// 6 (iPhone)
    case x1p5
    /// 8 (iPhone)
    case x2
    /// 12 (iPhone)
    case x3
    /// 16 (iPhone)
    case x4
    /// 20 (iPhone)
    case x5
    /// 24 (iPhone)
    case x6
    /// 28 (iPhone)
    case x7
    /// 32 (iPhone)
    case x8
    /// 36 (iPhone)
    case x9
    /// 40 (iPhone)
    case x10

    private var spacingType: SpacingType.Type {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return iPhoneSpacing.self
        case .pad:
            return iPadSpacing.self
        default:
            fatalError("Add missing spacing type")
        }
    }
    
    public var rawValue: Int {
        switch self {
        case .x0p5:
            return spacingType.x0p5.rawValue
        case .x1:
            return spacingType.x1.rawValue
        case .x1p5:
            return spacingType.x1p5.rawValue
        case .x2:
            return spacingType.x2.rawValue
        case .x3:
            return spacingType.x3.rawValue
        case .x4:
            return spacingType.x4.rawValue
        case .x5:
            return spacingType.x6.rawValue
        case .x6:
            return spacingType.x6.rawValue
        case .x7:
            return spacingType.x7.rawValue
        case .x8:
            return spacingType.x8.rawValue
        case .x9:
            return spacingType.x9.rawValue
        case .x10:
            return spacingType.x10.rawValue
        }
    }
}

// MARK: - iPhone specing
public enum iPhoneSpacing: Int, SpacingType {
    case x0p5 = 2
    case x1 = 4
    case x1p5 = 6
    case x2 = 8
    case x3 = 12
    case x4 = 16
    case x5 = 20
    case x6 = 24
    case x7 = 28
    case x8 = 32
    case x9 = 36
    case x10 = 40
}

// MARK: - iPad spacing
private enum iPadSpacing: Int, SpacingType {
    // TODO: - Adjuct accordingly if needed
    case x0p5 = 2
    case x1 = 4
    case x1p5 = 6
    case x2 = 8
    case x3 = 12
    case x4 = 16
    case x5 = 20
    case x6 = 24
    case x7 = 28
    case x8 = 32
    case x9 = 36
    case x10 = 40
}

public extension View {
    func padding(_ edges: Edge.Set = .all, _ spacing: Padding) -> some View {
        return self
            .padding(edges, CGFloat(spacing.rawValue))
    }
}
