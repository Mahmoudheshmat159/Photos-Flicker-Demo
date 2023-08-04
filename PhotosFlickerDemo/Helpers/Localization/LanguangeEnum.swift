//
//  LanguangeEnum.swift
//  SupportI
//
//  Created by M.abdu on 4/20/20.
//  Copyright © 2020 MahmoudHeshmat. All rights reserved.
//

import Foundation

public enum Languages: String {
    case arabic = "ar"
    case english = "en"
    case frensh = "fr"
    
    init?(_ caseName: String) {
        switch caseName {
            case "ar": self.init(rawValue: "ar")
            case "en": self.init(rawValue: "en")
            case "fr": self.init(rawValue: "fr")
            default: self.init(rawValue: "")
        }
    }
}


class Messages: NSObject {
    static var appName: String { return "Effa".localized }
    static var success: String { return "Success".localized }
    static var error: String { return "Error".localized }
    
    static var shouldAtLeat: String { return "Should at least".localized }
    static var letters: String { return "Letter".localized }
    static var shouldAtMost: String { return "At most".localized }
    static var field: String { return "Field".localized }
    static var warning: String { return "Warning".localized }
    static var info: String { return "Information".localized }

    static var done: String { return "Done".localized }
    static var cancel: String { return "Cancel".localized }
    
    static var DecodeError: String { return "Value Decoding Error".localized }
}
