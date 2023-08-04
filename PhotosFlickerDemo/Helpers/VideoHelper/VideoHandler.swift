//
//  VideoHandler.swift
//  EffaiOS
//
//  Created by apple on 4/20/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import AVFoundation
import Foundation
import UIKit
import AVKit


protocol Pageable {
    var pageIndex: Int {get}
}

extension AVPlayerViewController {
    typealias PlayerDismissHandler = () -> Void
    class On {
        var handler:PlayerDismissHandler?
    }
    
    private struct AssociatedKey {
        static var page  = "mz_page"
        static var dismiss  = "mz_Dismiss"
    }
    var page: String {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.page) as? String ?? "0"
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKey.page, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    var dismissHandler: PlayerDismissHandler? {
        
        get {
            if let on = objc_getAssociatedObject(self, &AssociatedKey.dismiss) as? On {
                return on.handler
            }else {
                return nil
            }
        }set(newValue) {
            let on = On()
            on.handler = newValue
            objc_setAssociatedObject(self, &AssociatedKey.dismiss, on, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

// create an extension of AVPlayerViewController
extension AVPlayerViewController : Pageable {
    
    var pageIndex: Int  {
        return Int(self.page) ?? 0
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    // override 'viewWillDisappear'
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // now, check that this ViewController is dismissing
        self.dismissHandler?()
    }
}
