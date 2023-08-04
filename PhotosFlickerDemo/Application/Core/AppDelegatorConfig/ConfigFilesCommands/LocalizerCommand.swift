///**

/**

PhotosFlickerDemo

Created by: apple on 8/4/23

Copyright (c) 2023 Rowaad


**/


import Foundation

//MARK: - LocalizerCommand
struct LocalizerCommand: Command {
    func execute() {
        Localizer.initLang()
        Localizer.activate(true)
    }
}
