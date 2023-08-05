//
//  GuardNumeric.swift
//  FlickerDemo
//
//  Created by apple on 3/23/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ...  Guard Numeric
internal struct GuardNumeric: Guard {
    
    // MARK: - ...  vars
    var textField: UITextField!
    
    
    // MARK: - ...  functions
    func confirm() -> Bool {
        guard textField.text?.isNumeric == true else {
            return false
        }
        return true
    }
    func errorMessage(_ field: String?) -> String? {
        return "\(field ?? "") \("is incorrect numeric".localized)"
    }
}

