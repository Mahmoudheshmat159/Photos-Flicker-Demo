//
//  ValidatorTextFieldDelegate.swift
//  EffaiOS
//
//  Created by apple on 3/23/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit
// MARK: - ...  Validator facade
@objc protocol ValidatorTextFieldDelegate: NSObjectProtocol {
    @objc optional func textFieldDidEndEditing(_ textField: UITextField)
    @objc optional func textFieldDidBeginEditing(_ textField: UITextField)
    @objc optional func textFieldDidChange(_ textField: UITextField)
}


