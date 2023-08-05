//
//  AppDelegateExtension.swift
//  FlickerDemo
//
//  Created by apple on 4/27/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import UserNotifications

// MARK: - ...  Push Notification Helper & sound Handler
typealias SoundHandler = (Bool) -> Void
private let gcmMessageIDKey = "gcm.message_id"
// MARK: - ...  Notification Control functions
extension AppDelegate: FirebaseNotificationDelegate {
    // MARK: - ...  Did click on notification
    func notificationControl(notification: [AnyHashable: Any]) {
    }
    // MARK: - ...  Did present the notification
    func notificationControlWillPresent(notification: [AnyHashable: Any], closure: SoundHandler? = nil) {
        closure?(true)
    }
}

