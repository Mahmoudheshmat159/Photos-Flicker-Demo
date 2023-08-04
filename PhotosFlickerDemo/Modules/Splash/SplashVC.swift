//
//  SplashVC.swift
//  EffaiOS
//
//  Created by apple on 3/2/23.
//  Copyright © 2023 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit

// MARK: - ...  ViewController - Vars
class SplashVC: BaseController {

    var viewModel: SplashViewModel?
    var coordinator: SplashCoordinator?
}

// MARK: - ...  LifeCycle
extension SplashVC {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSplashAnimation { [weak self] finished in
            self?.coordinator?.restart(storyboard: R.storyboard.moviesStoryboard())
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel = .init()
        coordinator = .init()
        coordinator?.view = self
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel = nil
        coordinator = nil
    }
}
// MARK: - ...  Functions
extension SplashVC {
    func setup() {
    }
}
// MARK: - ...  View Contract
extension SplashVC {
}
