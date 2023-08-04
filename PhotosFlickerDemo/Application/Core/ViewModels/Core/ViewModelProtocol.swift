//
//  ViewModelProtocol.swift
//  SupportI
//
//  Created by Mahmoud Heshmat on 5/21.
//  Copyright © 2018 MahmoudHeshmat. All rights reserved.
//

import Foundation
import Alamofire
// MARK: - ...  ViewModelProtocol Protocol
// All ViewModels must implement this protocol
protocol ViewModelProtocol {
    // All requests in view model
    var requests: [DataRequest?] { get set }
    func removeTasks()

}
// MARK: - ...  Implement pagination functions
extension ViewModelProtocol {
    func removeTasks() {
        requests.forEach { (request) in
            request?.task?.cancel()
        }
    }
}
