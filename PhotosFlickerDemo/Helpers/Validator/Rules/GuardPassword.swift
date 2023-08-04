//
//  GuardPassword.swift
//  EffaiOS
//
//  Created by apple on 3/23/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit


internal struct GuardPassword: Guard {
    
    // MARK: - ...  vars
    var textField: UITextField!
    private var minimumLength: Int = 6
    private var maximumLength: Int = 24
    
    
    // MARK: - ...  functions
    func confirm() -> Bool {
        guard textField.text!.count > 5, textField.text!.count < 24 else {
            return false
        }
        return true
    }
    func errorMessage(_ field: String?) -> String? {
        return "\(Messages.field) \(Messages.shouldAtLeat) \(minimumLength) \(Messages.letters) \(Messages.shouldAtMost) \(maximumLength) \(Messages.letters)"
    }
}
