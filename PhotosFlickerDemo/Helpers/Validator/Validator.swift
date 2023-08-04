//
//  Validator.swift
//  EffaiOS
//
//  Created by apple on 3/23/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit


// MARK: - ...  Validator class
open class Validator: NSObject {
    // MARK: - ...  vars
    private var textFields: [GuardModel] = []
    private var guardOnSuperViewOfTextField: Bool = false
    private var validatorUIType: [ValidatorUIType] = [.none]
    private var orginalTextColor: UIColor = .white
    private var orginalPlaceholderColor: UIColor = .white
    weak var delegate: ValidatorTextFieldDelegate?
    
    // MARK: - ...  init
    override init() { }

    init(guardOnSuperViewOfTextField: Bool = false, validatorUIType: [ValidatorUIType] = [.none]) {
        self.guardOnSuperViewOfTextField = guardOnSuperViewOfTextField
        self.validatorUIType = validatorUIType
        
    }
    
    public func getFieldsCount() -> Int {
        return textFields.count
    }
    
    public func removeLastField() {
        textFields.removeLast()
    }
}

// MARK: - ...  append
extension Validator {
    func append(_ textField: UITextField, rules: [Guard], title: String?) {
        textField.delegate = self
        textField.addTarget(self, action: #selector(Validator.textFieldDidChange(_:)), for: .editingChanged)
        textFields.append(.init(textField: textField, rules: rules, title: title))
        
        orginalTextColor = textField.textColor ?? .white
    }
    
    func append(_ textField: UITextField, rules: [Guard]) {
        textField.delegate = self
        textField.addTarget(self, action: #selector(Validator.textFieldDidChange(_:)), for: .editingChanged)
        textFields.append(.init(textField: textField, rules: rules, title: nil))
        
        orginalTextColor = textField.textColor ?? .white
    }
}
// MARK: - ...  validate
extension Validator {
    var validate: Bool {
        var successValidate = true
        for textField in textFields {
            if !validateGuard(textField) {
                successValidate = validateGuard(textField)
            }
        }
        return successValidate
    }
}


// MARK: - ...  Validator guard
extension Validator: ValidatorGuard {
    func validateGuard(_ textField: UITextField) -> Bool? {
        for field in textFields {
            if field.textField == textField {
                return validateGuard(field)
            }
        }
        return nil
    }
    func validateGuard(_ textField: GuardModel) -> Bool {
        var successValidate = true
        for var rule in textField.rules {
            rule.textField = textField.textField
            if !rule.confirm() {
                successValidate = false
                textField.shake(guardOnSuperViewOfTextField)
                handleTextFieldError(textField.textField)
                if guardOnSuperViewOfTextField {
                    handleSuperViewOfTextField(textField.textField, false)
                }
            } else {
                handleTextFieldSuccess(textField.textField)
                if guardOnSuperViewOfTextField {
                    handleSuperViewOfTextField(textField.textField, true)
                }
            }
        }
        return successValidate
    }
    func guardModel(_ textField: UITextField) -> GuardModel? {
        for index in 0..<textFields.count {
            if textFields[index].textField == textField {
                return textFields[index]
            }
        }
        return nil
    }
}

// MARK: - ...  Handle UI
extension Validator: ValidatorUI, ValidatorUnderlineUI, ValidatorInfoMarkUI, ValidatorLabelUI {
    
    func handleTextFieldError(_ textField: UITextField) {
        if textField.text?.isEmpty == false {
            textField.textColor = .red
        } else {
            textField.setPlaceHolderTextColor(.red)
        }
    }
    func handleTextFieldSuccess(_ textField: UITextField) {
        if textField.text?.isEmpty == false {
            textField.textColor = orginalTextColor//.white
        } else {
            textField.setPlaceHolderTextColor(.placeholderText)
        }
    }
    func handleSuperViewOfTextField(_ textField: UITextField, _ success: Bool) {
        if !guardOnSuperViewOfTextField {
            return
        }
        
        for ui in validatorUIType {
            switch ui {
            case .infoMark:
                handleInfoMark(textField, success)
            case .underline:
                handleUnderline(textField, success)
            case .label:
                handleLabel(textField, success)
            case .scroll(let scroll):
                handleScroll(scroll, for: textField)
            default:
                break
            }
        }
    }
    
    func handleUnderline(_ textField: UITextField, _ success: Bool) {
        let model = guardModel(textField)
        if success {
            removeUnderline(in: model)
        } else {
            insertUnderline(in: model)
        }
    }
    func handleInfoMark(_ textField: UITextField, _ success: Bool) {
        let model = guardModel(textField)
        if success {
            removeInfoMark(in: model)
        } else {
            insertInfoMark(in: model)
        }
    }
    func handleLabel(_ textField: UITextField, _ success: Bool) {
        let model = guardModel(textField)
        if success {
            removeLabel(in: model)
        } else {
            insertLabel(in: model)
        }
    }
    func handleScroll(_ scrollView: UIScrollView, for textField: UITextField) {
        let point = CGPoint(x: scrollView.x, y: textField.y)
        scrollView.setContentOffset(point, animated: true)
    }
}


// MARK: - ...  TextField Delegation
extension Validator: UITextFieldDelegate {
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldDidChange(textField)
        handleTextFieldSuccess(textField)
        if guardOnSuperViewOfTextField {
            handleSuperViewOfTextField(textField, true)
        }
        delegate?.textFieldDidBeginEditing?(textField)
    }
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if validateGuard(textField) == true {
            handleTextFieldSuccess(textField)
            if guardOnSuperViewOfTextField {
                handleSuperViewOfTextField(textField, true)
            }
        } else {
            handleTextFieldError(textField)
            if guardOnSuperViewOfTextField {
                handleSuperViewOfTextField(textField, false)
            }
        }
        delegate?.textFieldDidEndEditing?(textField)
    }
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        // MARK: - ...  Check is max char in text field
        let model = guardModel(textField)
        for rule in model?.rules ?? [] {
            if let rule = rule as? GuardLength {
                if let max = rule.max {
                    if newString.length >= max {
                        return false
                    } else {
                        return true
                    }
                }
            }
        }
        return true
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        delegate?.textFieldDidChange?(textField)
    }
}




