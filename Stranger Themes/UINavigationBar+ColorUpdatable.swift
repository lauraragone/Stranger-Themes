//
//  UINavigationBar+ColorUpdatable.swift
//  Stranger Themes
//
//  Created by Laura on 2/10/17.
//  Copyright © 2017 Laura Ragone. All rights reserved.
//

import UIKit

extension UINavigationBar {

    // MARK: - ColorUpdatable

    func updateColors(for theme: Theme) {
        let barStyle: UIBarStyle = {
            switch theme {
            case .light:
                return .default
            case .dark:
                return .blackTranslucent
            }
        }()
        self.barStyle = barStyle
    }
}
