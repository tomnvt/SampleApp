import SwiftUI
import UIKit

extension UIFont {
    typealias Font = FontFamily.Exo2

    /// Bold 32
    static var headline1 = Font.bold.font(size: FontSizes.headline1)
    /// Bold 28
    static var headline2 = Font.bold.font(size: FontSizes.headline2)
    /// Bold 23
    static var headline3 = Font.bold.font(size: FontSizes.headline3)
    /// Bold 20
    static var headline4 = Font.bold.font(size: FontSizes.headline4)
    /// Bold 18
    static var headline5 = Font.bold.font(size: FontSizes.headline5)
    /// Bold 16
    static var headline6 = Font.bold.font(size: FontSizes.headline6)
    /// Bold 14
    static var headline7 = Font.bold.font(size: FontSizes.headline7)
    /// Bold 12
    static var headline8 = Font.bold.font(size: FontSizes.headline8)

    /// 20
    static var body1 = (regular: Font.regular.font(size: FontSizes.body1),
                        bold: Font.bold.font(size: FontSizes.body1),
                        semibold: Font.semiBold.font(size: FontSizes.body1))
    /// 18
    static var body2 = (regular: Font.regular.font(size: FontSizes.body2),
                        bold: Font.bold.font(size: FontSizes.body2),
                        semibold: Font.semiBold.font(size: FontSizes.body2))
    /// 16
    static var body3 = (regular: Font.regular.font(size: FontSizes.body3),
                        bold: Font.bold.font(size: FontSizes.body3),
                        semibold: Font.semiBold.font(size: FontSizes.body3))
    /// 14
    static var body4 = (regular: Font.regular.font(size: FontSizes.body4),
                        bold: Font.bold.font(size: FontSizes.body4),
                        semibold: Font.semiBold.font(size: FontSizes.body4))

    /// 12
    static var meta1 = Font.regular.font(size: FontSizes.meta1)
    /// 10
    static var meta2 = Font.regular.font(size: FontSizes.meta2)
}

extension SwiftUI.Font {
    typealias Font = FontFamily.Exo2

    /// Bold 32
    static var headline1 = Font.regular.swiftUIFont(size: FontSizes.headline1)
    /// Bold 28
    static var headline2 = Font.regular.swiftUIFont(size: FontSizes.headline2)
    /// Bold 23
    static var headline3 = Font.regular.swiftUIFont(size: FontSizes.headline3)
    /// Bold 20
    static var headline4 = Font.regular.swiftUIFont(size: FontSizes.headline4)
    /// Bold 18
    static var headline5 = Font.regular.swiftUIFont(size: FontSizes.headline5)
    /// Bold 16
    static var headline6 = Font.regular.swiftUIFont(size: FontSizes.headline6)
    /// Bold 14
    static var headline7 = Font.regular.swiftUIFont(size: FontSizes.headline7)
    /// Bold 12
    static var headline8 = Font.regular.swiftUIFont(size: FontSizes.headline8)

    /// 20
    static var body1 = (regular: Font.regular.swiftUIFont(size: FontSizes.body1),
                        bold: Font.bold.swiftUIFont(size: FontSizes.body1),
                        semibold: Font.semiBold.swiftUIFont(size: FontSizes.body1))
    /// 18
    static var body2 = (regular: Font.regular.swiftUIFont(size: FontSizes.body2),
                        bold: Font.bold.swiftUIFont(size: FontSizes.body2),
                        semibold: Font.semiBold.swiftUIFont(size: FontSizes.body2))
    /// 16
    static var body3 = (regular: Font.regular.swiftUIFont(size: FontSizes.body3),
                        bold: Font.bold.swiftUIFont(size: FontSizes.body3),
                        semibold: Font.semiBold.swiftUIFont(size: FontSizes.body3))
    /// 14
    static var body4 = (regular: Font.regular.swiftUIFont(size: FontSizes.body4),
                        bold: Font.bold.swiftUIFont(size: FontSizes.body4),
                        semibold: Font.semiBold.swiftUIFont(size: FontSizes.body4))

    /// 12
    static var meta1 = Font.regular.swiftUIFont(size: FontSizes.meta1)
    /// 10
    static var meta2 = Font.regular.swiftUIFont(size: FontSizes.meta2)
}

private struct FontSizes {
    static var headline1: CGFloat = 32
    static var headline2: CGFloat = 28
    static var headline3: CGFloat = 23
    static var headline4: CGFloat = 20
    static var headline5: CGFloat = 18
    static var headline6: CGFloat = 16
    static var headline7: CGFloat = 14
    static var headline8: CGFloat = 12

    static var body1: CGFloat = 20
    static var body2: CGFloat = 18
    static var body3: CGFloat = 16
    static var body4: CGFloat = 14

    static var meta1: CGFloat = 12
    static var meta2: CGFloat = 10
}
