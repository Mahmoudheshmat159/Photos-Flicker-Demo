//
//  CorePresentingViewModel.swift
//  SupportI
//
//  Created by Mahmoud Heshmat on 5/21.
//  Copyright © 2018 MahmoudHeshmat. All rights reserved.
//

import Foundation
import UIKit

// All ViewControllers must implement this protocol
protocol PresentingViewProtocol: NSObjectProtocol {
    func startLoading()
    func stopLoading()
    func didError(error: String?)
}

// implementation of PresentingViewProtocol only in cases where the presenting view is a UIViewController
extension PresentingViewProtocol where Self: BaseController {
}
