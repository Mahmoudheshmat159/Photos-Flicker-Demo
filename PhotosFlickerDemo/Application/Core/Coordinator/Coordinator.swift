//
//  Coordinator.swift
//  BaseIOS
//
//  Created by M.abdu on 10/12/20.
//  Copyright © 2020 com.. All rights reserved.
//

import Foundation
import UIKit
// MARK: - ...  Coordinator for All Application
class Coordinator: NSObject {
    let storyboard: UIStoryboard = R.storyboard.splashStoryboard()
    // MARK: - ...  Restart the main storyboard
    func restart(storyboard: UIStoryboard = Coordinator.instance.storyboard) {
        let scene = storyboard.instantiateInitialViewController()
        let delegate = UIApplication.shared.delegate as? AppDelegate
        delegate?.window?.rootViewController = scene
    }
    func unAuthorized() {
        
    }
    func networkFail() {
  
    }
    func maintance() {
    }
    
    
}


// MARK: - ...  Coordinator Singletone
extension Coordinator {
    struct Static {
        static var instance: Coordinator?
    }
    class var instance: Coordinator {
        if Static.instance == nil {
            Static.instance = Coordinator()
        }
        return Static.instance!
    }
}
