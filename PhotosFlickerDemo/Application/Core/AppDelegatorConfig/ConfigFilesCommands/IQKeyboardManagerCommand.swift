///**

/**

PhotosFlickerDemo

Created by: apple on 8/4/23

Copyright (c) 2023 Rowaad


**/


import Foundation
import IQKeyboardManagerSwift

//MARK: - IQKeyboardManagerCommand
struct IQKeyboardManagerCommand: Command {
    func execute() {
        IQKeyboardManager.shared.enable = true
    }
}


