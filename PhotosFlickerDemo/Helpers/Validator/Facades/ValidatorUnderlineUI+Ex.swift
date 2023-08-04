//
//  ValidatorUnderlineUI+Ex.swift
//  EffaiOS
//
//  Created by apple on 3/23/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ...  Extension of validator underline
extension ValidatorUnderlineUI {
    func insertUnderline(in model: GuardModel?) {
        guard let model = model else { return }
        guard let view = model.textField.superview else { return }
        let underline = UIView()
        underline.backgroundColor = .red
        underline.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(underline)
        underline.addBottomConstraint(toView: view, constant: 0)
        underline.addTrailingConstraint(toView: view, constant: 0)
        underline.addLeadingConstraint(toView: view, constant: 0)
        underline.addHeightConstraint(toView: nil, constant: 3)
        
        model.view = underline
    }
    func removeUnderline(in model: GuardModel?) {
        model?.view?.backgroundColor = .clear
    }
}
