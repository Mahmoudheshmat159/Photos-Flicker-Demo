//
//  UIFontOverride.swift
//  Fawid
//
//  Created by M.abdu on 4/20/20.
//  Copyright © 2020 MahmoudHeshmat. All rights reserved.
//

import Foundation
import UIKit

public enum Fonts: String {
    case regular = "Almarai-Regular"
    case bold = "Almarai-Bold"
    case medium = "Almarai-ExtraBold"
    case light = "Almarai-Light"
}

extension UIFontDescriptor.AttributeName {
    static let nsctFontUIUsage = UIFontDescriptor.AttributeName(rawValue: "NSCTFontUIUsageAttribute")
}

extension UIFont {
    static var isOverrided: Bool = false
    @objc class func appFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: Fonts.regular.rawValue, size: size)!
    }
    @objc class func boldAppFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: Fonts.bold.rawValue, size: size)!
    }
    @objc class func mediumAppFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: Fonts.medium.rawValue, size: size)!
    }
    @objc class func lightAppFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: Fonts.light.rawValue, size: size)!
    }
    @objc convenience init(myCoder aDecoder: NSCoder) {
        guard
            let fontDescriptor = aDecoder.decodeObject(forKey: "UIFontDescriptor") as? UIFontDescriptor,
            let fontAttribute = fontDescriptor.fontAttributes[.nsctFontUIUsage] as? String else {
                self.init(myCoder: aDecoder)
                return
        }
        var fontName = ""
        switch fontAttribute {
            case "CTFontRegularUsage":
                fontName = Fonts.regular.rawValue
            case "CTFontEmphasizedUsage", "CTFontBoldUsage":
                fontName = Fonts.bold.rawValue
            case "CTFontObliqueUsage":
                fontName = Fonts.regular.rawValue
            case "CTFontMediumUsage":
                fontName = Fonts.medium.rawValue
            case "CTFontLightUsage":
                fontName = Fonts.light.rawValue
            default:
                fontName = Fonts.regular.rawValue
        }
        self.init(name: fontName, size: fontDescriptor.pointSize)!
    }
    class func overrideInitialize() {
        guard self == UIFont.self, !isOverrided else { return }
        // Avoid method swizzling run twice and revert to original initialize function
        isOverrided = true
        if let systemFontMethod = class_getClassMethod(self, #selector(systemFont(ofSize:))),
            let mySystemFontMethod = class_getClassMethod(self, #selector(appFont(ofSize:))) {
            method_exchangeImplementations(systemFontMethod, mySystemFontMethod)
        }
        if let boldSystemFontMethod = class_getClassMethod(self, #selector(boldSystemFont(ofSize:))),
            let myBoldSystemFontMethod = class_getClassMethod(self, #selector(boldAppFont(ofSize:))) {
            method_exchangeImplementations(boldSystemFontMethod, myBoldSystemFontMethod)
        }
        if let initCoderMethod = class_getInstanceMethod(self, #selector(UIFontDescriptor.init(coder:))), // Trick to get over the lack of UIFont.init(coder:))
            let myInitCoderMethod = class_getInstanceMethod(self, #selector(UIFont.init(myCoder:))) {
            method_exchangeImplementations(initCoderMethod, myInitCoderMethod)
        }
    }
}
