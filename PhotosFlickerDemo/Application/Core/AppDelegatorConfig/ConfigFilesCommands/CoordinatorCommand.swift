///**

/**

PhotosFlickerDemo

Created by: apple on 8/4/23

Copyright (c) 2023 Rowaad


**/


import Foundation


//MARK: - CoordinatorCommand
struct CoordinatorCommand: Command {
    func execute() {
        Coordinator.instance.restart()
    }
}
