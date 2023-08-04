//
//  SplashCoordinator.swift
//  EffaiOS
//
//  Created by apple on 3/2/23.
//  Copyright © 2023 Mahmoud.Heshmat. All rights reserved.
//

import Foundation

// MARK: - ...  Router
class SplashCoordinator: Coordinator {
    typealias PresentingView = SplashVC
    weak var view: PresentingView?
    deinit {
        self.view = nil
    }
}

extension SplashCoordinator {
    
}
