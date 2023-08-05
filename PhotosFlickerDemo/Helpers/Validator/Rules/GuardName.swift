//
//  GuardName.swift
//  FlickerDemo
//
//  Created by apple on 3/23/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit

internal struct GuardName: Guard {
    
    // MARK: - ...  vars
    var textField: UITextField!
    private var minimumLength: Int = 2
    private var maximumLength: Int = 24
    
    // MARK: - ...  functions
    func confirm() -> Bool {
        guard let txt = textField.text else { return false }
        guard txt.count > 1, txt.count < 24, !txt.isNumeric else {
            return false
        }
        return true
    }
    
    func errorMessage(_ field: String?) -> String? {
        return "\(Messages.field) \(Messages.shouldAtLeat) \(minimumLength) \(Messages.shouldAtMost) \(maximumLength) \(Messages.letters)"
    }
}
