//
//  GuardRequired.swift
//  EffaiOS
//
//  Created by apple on 3/23/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit

// MARK: - ...  Guard required
internal struct GuardRequired: Guard {
    
    // MARK: - ...  vars
    var textField: UITextField!

    // MARK: - ... functions
    func confirm() -> Bool {
        guard !(textField?.text?.isEmpty ?? false) else {
            return false
        }
        return true
    }
    func errorMessage(_ field: String?) -> String? {
        return "\(field ?? "") \("is required".localized)"
    }
}
