//
//  ColorThemeObserving.swift
//  Stranger Themes
//
//  Created by Laura Ragone on 2/10/17.
//  Copyright © 2017 Laura Ragone. All rights reserved.
//

import UIKit

/// A protocol for observing `didChangeColorTheme` custom notifications. Call `addDidChangeColorThemeObserver` upon instantiation and `removeDidChangeColorThemeObserver` upon deinit to adapt to the app's color theme setting.
protocol ColorThemeObserving {
    
    /// Call this method upon instantiation to observe `didChangeColorTheme` notifications.
    ///
    /// - Parameter notificationCenter: The mechanism for broadcasting color theme change information throughout the program.
    func addDidChangeColorThemeObserver(notificationCenter: NotificationCenter)
    
    /// Call this method upon deinit to remove notification observation.
    ///
    /// - Parameter notificationCenter: The mechanism for broadcasting color theme change information throughout the program.
    func removeDidChangeColorThemeObserver(notificationCenter: NotificationCenter)

    /// Called whenever a `didChangeColorTheme` notification is received. Adapts the color theme to the app's current color theme preference.
    ///
    /// - Parameter notification: The `didChangeColorTheme` custom notification.
    func didChangeColorTheme(_ notification: Notification)
}

// MARK: - ColorThemeObserving

private extension ColorThemeObserving {
    
    func theme(from notification: Notification) -> Theme? {
        guard let userInfo = notification.userInfo,
            let theme = userInfo[CustomNotification.didChangeColorTheme.rawValue] as? Theme else {
                assertionFailure("Unexpected user info value type.")
                return nil
        }
        return theme
    }
    
    /// Updates the colors of `ColorUpdatable`-conforming objects.
    func updateColors(from notification: Notification) {
        guard let theme = theme(from: notification) else { return }
        
        if var colorUpdatableThing = self as? ColorUpdatable, theme != colorUpdatableThing.theme {
            colorUpdatableThing.theme = theme
            colorUpdatableThing.updateColors(for: theme)
        }
    }
}

// MARK: - UIViewController

extension UIViewController: ColorThemeObserving {

    func addDidChangeColorThemeObserver(notificationCenter: NotificationCenter = NotificationCenter.default) {
        notificationCenter.addObserver(self,
                                       selector: #selector(didChangeColorTheme(_:)),
                                       name: Notification.Name(rawValue:
                                        CustomNotification.didChangeColorTheme.rawValue),
                                       object: nil)
    }
    
    func removeDidChangeColorThemeObserver(notificationCenter: NotificationCenter = NotificationCenter.default) {
        notificationCenter.removeObserver(self,
                                          name: Notification.Name(rawValue:
                                            CustomNotification.didChangeColorTheme.rawValue),
                                          object: nil)
    }

    @objc func didChangeColorTheme(_ notification: Notification) {
        updateColors(from: notification)
    }
}

// MARK: - UITableViewController

extension UITableViewController {
    
    @objc override func didChangeColorTheme(_ notification: Notification) {
        updateColors(from: notification)
        tableView.reloadData()
    }
}

// MARK: - UICollectionViewController

extension UICollectionViewController {
    
    @objc override func didChangeColorTheme(_ notification: Notification) {
        updateColors(from: notification)
        collectionView?.reloadData()
    }
}
