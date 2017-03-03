//
//  CustomNotification.swift
//  Stranger Themes
//
//  Created by Laura Ragone on 2/10/17.
//  Copyright © 2017 Laura Ragone. All rights reserved.
//

import Foundation

/// Custom notifications for which to broadcast important messages throughout the app.
///
/// - didChangeColorTheme: A notification indicating that the app's color theme has changed.
enum CustomNotification: String {
    
    case didChangeColorTheme
    
    /// Broadcasts a global notification.
    ///
    /// - Parameters:
    ///   - notificationCenter: The mechanism for broadcasting information throughout the app.
    ///   - object: The object posting the notification.
    ///   - userInfo: Information about the the notification.
    func post(notificationCenter: NotificationCenter = NotificationCenter.default, object: AnyObject? = nil, userInfo: Any) {
        let userInfo = [self.rawValue: userInfo]
        DispatchQueue.main.async {
            notificationCenter.post(name: Notification.Name(rawValue: self.rawValue), object: object, userInfo: userInfo)
        }
    }
    
    /// Observes a global notification using a provided method.
    ///
    /// - Parameters:
    ///   - notificationCenter: The mechanism for broadcasting information throughout the app.
    ///   - target: The object on which to call the `selector` method.
    ///   - selector: The method to call when the notification is broadcast.
    func observe(notificationCenter: NotificationCenter = NotificationCenter.default, target: AnyObject, selector: Selector) {
        notificationCenter.addObserver(target, selector: selector, name: Notification.Name(rawValue: self.rawValue), object: nil)
    }
}
