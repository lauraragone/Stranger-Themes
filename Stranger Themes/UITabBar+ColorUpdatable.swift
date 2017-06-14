//
//  UITabBar+ColorUpdatable.swift
//  Stranger Themes
//
//  Created by Laura Ragone on 2/10/17.
//  Copyright © 2017 Laura Ragone. All rights reserved.
//

import UIKit

extension UITabBar {
    
    // MARK: - ColorUpdatable
    
    func updateColors(for theme: Theme) {
        let barStyle: UIBarStyle = {
            switch theme {
            case .light:
                return .default
            case .dark:
                return .black
            }
        }()
        self.barStyle = barStyle
    }
}
