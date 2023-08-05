//
//  Noon.swift
//  FlickerDemo
//
//  Created by apple on 4/19/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import UIKit

protocol NoonDelegate: AnyObject {
    func noon(_ noon: Noon?, success pay: Bool)
    func noon(_ noon: Noon?, fail pay: Bool)
}

class Noon: NSObject {
    
    var url: String?
    weak var delegate: NoonDelegate?
    
    init(url: String?) {
        super.init()
        self.url = url
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("NOON_PAYMENT"), object: nil)

    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name("NOON_PAYMENT"), object: nil)
    }
    
    func present(in view: UIViewController?) {
        guard let url = url else { return }
        guard let urlValue = URL(string: url) else {
            return
        }
        let scene = R.storyboard.noonWebView.noonWebView()!
        scene.url = urlValue
        scene.delegate = delegate
        view?.present(scene, animated: true, completion: nil)
    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
        self.delegate?.noon(self, success: true)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("NOON_PAYMENT"), object: nil)
    }

}


