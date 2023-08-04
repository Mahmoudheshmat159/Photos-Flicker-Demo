//
//  ValidatorUIType.swift
//  EffaiOS
//
//  Created by apple on 3/23/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit

// MARK: - ...  Guard UI Type of each text field
enum ValidatorUIType {
    case underline
    case infoMark
    case label
    case scroll(scroll: UIScrollView)
    // MARK: - ... only red in text
    case none
}
