//
//  FlickerDemo
//
//  Created by apple on 8/4/23.
//  Copyright © 2023 Mahmoud.Heshmat. All rights reserved.
//


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
