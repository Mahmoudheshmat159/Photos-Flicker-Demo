//
//  ValidatorGuard.swift
//  FlickerDemo
//
//  Created by apple on 3/23/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ...  Validate for every guard
protocol ValidatorGuard: NSObjectProtocol {
    func validateGuard(_ textField: UITextField) -> Bool?
    func validateGuard(_ textField: GuardModel) -> Bool
    func guardModel(_ textField: UITextField) -> GuardModel?

}
