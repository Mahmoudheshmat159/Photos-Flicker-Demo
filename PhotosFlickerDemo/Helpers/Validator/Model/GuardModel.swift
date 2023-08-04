//
//  GuardModel.swift
//  EffaiOS
//
//  Created by apple on 3/23/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ...  Guard model
internal class GuardModel: GuardUI {
    
    // MARK: - ...  vars
    var textField: UITextField!
    var rules: [Guard]!
    var title: String?
    
    // MARK: - ...  functions
    func shake(_ superView: Bool = false) {
        if superView {
            textField.superview?.shake()
        } else {
            textField.shake()
        }
    }
    
    init(textField: UITextField, rules: [Guard], title: String? = nil) {
        super.init()
        self.textField = textField
        self.rules = rules
        self.title = title ?? textField.placeholder
    }
}

