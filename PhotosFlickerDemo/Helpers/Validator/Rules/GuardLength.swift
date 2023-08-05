//
//  GuardLength.swift
//  FlickerDemo
//
//  Created by apple on 3/23/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ...  Guard Length
internal struct GuardLength: Guard {
    
    // MARK: - ...  vars
    private var minimumLength: Int = 1
    private var maximumLength: Int?
    var textField: UITextField!
    var max: Int? {
        get {
            return maximumLength
        }
    }
    // MARK: - ...  init
    init(minimumLength: Int = 1, maximumLength: Int?) {
        self.minimumLength = minimumLength
        self.maximumLength = maximumLength
    }
    
    // MARK: - ...  functions
    func confirm() -> Bool {
        var valid = (textField.text?.count ?? 0 >= minimumLength)
        if let maximumLength = self.maximumLength {
            valid = (textField.text?.count ?? 0 <= maximumLength)
        }
        return valid
    }
    func errorMessage(_ field: String?) -> String? {
        //return "\(field ?? "") \("the length has error".localized)"
        if maximumLength == nil {
            return "\(Messages.field) \(Messages.shouldAtLeat) \(minimumLength) \(Messages.letters)"
        }else{
            return "\(Messages.field) \(Messages.shouldAtLeat) \(minimumLength) \(Messages.letters) \(Messages.shouldAtMost) \(maximumLength ?? 0) \(Messages.letters)"
        }
    }
}

