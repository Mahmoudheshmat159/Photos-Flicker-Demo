///**

/**

PhotosFlickerDemo

Created by: apple on 8/4/23

Copyright (c) 2023 Rowaad


**/


import Foundation

// MARK: - ...  Router
class MoviesCoordinator: Coordinator {
    typealias PresentingView = MoviesVC
    weak var view: PresentingView?
    deinit {
        self.view = nil
    }
}

extension MoviesCoordinator {
    
}
