//
//  Guard.swift
//  EffaiOS
//
//  Created by apple on 3/23/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ...  Guard
protocol Guard {
    var textField: UITextField! { get set }
    func confirm() -> Bool
    func errorMessage(_ field: String?) -> String?
}
