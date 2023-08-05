//
//  NotificationSetup.swift
//  FlickerDemo
//
//  Created by apple on 4/27/22.
//  Copyright © 2022 Mahmoud.Heshmat. All rights reserved.
//

import UIKit
import UserNotifications
import CoreData

// MARK: - ...  Firebase Control Delegation
protocol FirebaseNotificationDelegate: AnyObject {
    func setupFirebase()
    func subscribeFirebase()
    func unSubscribeFirebase()
    func notificationControl(notification: [AnyHashable: Any])
    func notificationControlWillPresent(notification: [AnyHashable: Any], closure: SoundHandler?)
}
extension FirebaseNotificationDelegate where Self: AppDelegate {
    // MARK: - ...  Setup the firebase notification
    func setupFirebase() {
        let application = UIApplication.shared
    }
    // MARK: - ...  Unsubscribe from push notification
    func unSubscribeFirebase() {
    }
    // MARK: - ...  Subscribe from push notification
    func subscribeFirebase() {
    }
}

