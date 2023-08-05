//
//  GuardPhone.swift
//  FlickerDemo
//
//  Created by apple on 3/23/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ...  Guard phone
internal struct GuardPhone: Guard {
    
    // MARK: - ...  vars
    var textField: UITextField!
    
    
    // MARK: - ...  functions
    func confirm() -> Bool {
        guard let text = textField.text, text.replacedArabicDigitsWithEnglish.count == 9 else {
            return false
        }
        return true
    }
    func errorMessage(_ field: String?) -> String? {
        return "\(field ?? "") \("is incorrect".localized)"
    }
}

