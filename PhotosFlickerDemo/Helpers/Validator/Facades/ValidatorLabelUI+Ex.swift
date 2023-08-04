//
//  ValidatorLabelUI+Ex.swift
//  EffaiOS
//
//  Created by apple on 3/23/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ...  Extension of validator Label error
extension ValidatorLabelUI {
    func errorMessage(in model: GuardModel?) -> String? {
        for var rule in model?.rules ?? [] {
            rule.textField = model?.textField
            if !rule.confirm() {
                return rule.errorMessage(model?.title)
            }
        }
        return nil
    }
    func insertLabel(in model: GuardModel?) {
        guard let model = model else { return }
        guard let view = model.textField else { return }
        if model.view != nil {
            return
        }
        let containView = UIView()
        let label = UILabel()
        label.textColor = .red
        label.text = errorMessage(in: model)
        label.font = ThemeApp.Fonts.regularFont(size: 11)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(containView)
        containView.addLeadingConstraint(toView: view, constant: 25)
        containView.addTrailingConstraint(toView: view, constant: -15)
        containView.addBottomConstraint(toView: view, constant: -10)
        containView.addHeightConstraint(toView: nil, constant: 13)
        
        containView.addSubview(label)
        label.addLeadingConstraint(toView: containView, constant: 0)
        label.addTrailingConstraint(toView: containView, constant: 0)
        label.addBottomConstraint(toView: containView, constant: -3)
        model.view = containView
        
        //model.textField.textColor = .black
        //model.textField.setPlaceHolderTextColor(.placeholderText)
        if let constraint = view.constraints.first(where: { $0.firstAttribute == .height }) {
            constraint.constant += 15
        }
        if let constraint = view.constraints.first(where: { $0.firstAttribute == .bottom }) {
            constraint.constant += 10
        }
    }
    func removeLabel(in model: GuardModel?) {
        if model?.view != nil {
            guard let view = model?.textField else { return }
            if let constraint = view.constraints.first(where: { $0.firstAttribute == .height }) {
                constraint.constant -= 15
                model?.view?.removeFromSuperview()
                model?.view = nil
            }
            if let constraint = view.constraints.first(where: { $0.firstAttribute == .bottom }) {
                constraint.constant -= 10
            }
        }
    }
    
}


