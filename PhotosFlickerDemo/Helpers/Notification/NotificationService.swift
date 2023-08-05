//
//  NotificationService.swift
//  FlickerDemo
//
//  Created by apple on 4/27/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit

enum NotificationActions : String {
    case chat
    case posts
    case beneficiaryFriend
    case campaign
}

class NotificationService: NSObject {
    
    func handleNotification(_ userInfo : [AnyHashable:Any] ){
        
    }
    
    func handleNotificationEvents(_ userInfo : [AnyHashable:Any] ){
        
        if let action = userInfo["notificationType"] as? String{ //notificationType
            switch action {
            case NotificationActions.chat.rawValue:
                NotificationCenter.default.post(name: .didRecieveNotification, object: nil)
                break
            default:
                break
            }
        }
    }
}


