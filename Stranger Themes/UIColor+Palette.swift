//
//  UIColor+Palette.swift
//  Stranger Themes
//
//  Created by Laura Ragone on 2/10/17.
//  Copyright © 2017 Laura Ragone. All rights reserved.
//

import UIKit

extension UIColor {
    
    // MARK: - Brand
    
    /// Returns the palette color associated with the Stranger Theme's brand.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of Stranger Theme's brand.
    /// - Returns: The palette color associated with the Stranger Theme's brand.
    class func brand(for theme: Theme) -> UIColor {
        return Palette.mulberryRed
    }
    
    // MARK: - Text
    
    /// Returns the palette color used for displaying text of primary importance on light backgrounds.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of primary text.
    /// - Returns: The palette color used for displaying text of primary importance.
    class func primaryText(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.black
        case .dark:
            return Palette.white
        }
    }
    
    /// Returns the palette color used for displaying text of secondary importance on light backgrounds.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of secondary text.
    /// - Returns: The palette color used for displaying text of secondary importance.
    class func secondaryText(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.steelGray
        case .dark:
            return Palette.silver
        }
    }
    
    // MARK: Inverted
    
    /// Returns the palette color used for displaying text of primary importance on dark backgrounds.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of primary text.
    /// - Returns: The palette color used for displaying text of primary importance.
    class func invertedPrimaryText(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.white
        case .dark:
            return Palette.black
        }
    }
    
    /// Returns the palette color used for displaying text of secondary importance on dark backgrounds.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of secondary text.
    /// - Returns: The palette color used for displaying text of secondary importance.
    class func invertedSecondaryText(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.silver
        case .dark:
            return Palette.steelGray
        }
    }
    
    // MARK: - Background
    
    
    /// Returns the light palette color used for the background for standard content.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of the background for standard content.
    /// - Returns: The light palette color used for the background for standard content.
    class func contentBackground(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.white
        case .dark:
            return Palette.black
        }
    }
    
    /// Returns the light palette color used for the background of a collection view.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of the background for a collection view.
    /// - Returns: The light palette color used for the background of a collection view.
    class func collectionBackground(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.groupedGray
        case .dark:
            return Palette.scrollGray
        }

    }
    
    // MARK: Inverted
    
    /// Returns the dark palette color used for the background for standard content.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of the background for standard content.
    /// - Returns: The dark palette color used for the background for standard content.
    class func invertedContentBackground(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.black
        case .dark:
            return Palette.white
        }

    }
    
    /// Returns the dark palette color used for the background of a collection view.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of the background for a collection view.
    /// - Returns: The dark palette color used for the background of a collection view.
    class func invertedCollectionBackground(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.scrollGray
        case .dark:
            return Palette.groupedGray
        }
    }
    
    // MARK: - Feedback
    
    /// Returns the palette color used for providing feedback regarding successful actions displayed on light backgrounds.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of feedback for successful actions.
    /// - Returns: The palette color used for providing feedback regarding successful actions displayed on light backgrounds.
    class func success(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.sushiGreen
        case .dark:
            return Palette.wasabiGreen
        }
    }
    
    /// Returns the palette color used for providing feedback regarding actions requiring attention displayed on light backgrounds.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of feedback for actions requiring attention.
    /// - Returns: The palette color used for providing feedback regarding actions requiring attention displayed on light backgrounds.
    class func attention(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.saffronYellow
        case .dark:
            return Palette.canaryYellow
        }
    }
    
    /// Returns the palette color used for providing feedback regarding unsuccessful actions displayed on light backgrounds.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of feedback for unsuccessful actions.
    /// - Returns: The palette color used for providing feedback regarding unsuccessful actions displayed on light backgrounds.
    class func failure(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.mulberryRed
        case .dark:
            return Palette.fireBushOrange
        }
    }
    
    // MARK: Inverted
    
    /// Returns the palette color used for providing feedback regarding successful actions displayed on dark backgrounds.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of feedback for successful actions.
    /// - Returns: The palette color used for providing feedback regarding successful actions displayed on dark backgrounds.
    class func invertedSuccess(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.ceruleanBlue
        case .dark:
            return Palette.saffronYellow
        }
    }
    
    /// Returns the palette color used for providing feedback regarding actions requiring attention displayed on dark backgrounds.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of feedback for actions requiring attention.
    /// - Returns: The palette color used for providing feedback regarding actions requiring attention displayed on dark backgrounds.
    class func invertedAttention(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.saffronYellow
        case .dark:
            return Palette.ceruleanBlue
        }
    }
    
    /// Returns the palette color used for providing feedback regarding unsuccessful actions displayed on dark backgrounds.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of feedback for unsuccessful actions.
    /// - Returns: The palette color used for providing feedback regarding unsuccessful actions displayed on dark backgrounds.
    class func invertedFailure(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.fireBushOrange
        case .dark:
            return Palette.mulberryRed
        }
    }
    
    // MARK: - Button
    
    /// Returns the palette color used for the background of buttons in the default state configuration displayed on light backgrounds.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of the background of buttons in the default state configuration.
    /// - Returns: The palette color used for the background of buttons in the default state configuration displayed on light backgrounds.
    class func normalButton(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.black
        case .dark:
            return Palette.white
        }
    }
    
    /// Returns the palette color used for the background of buttons in the highlighted state configuration displayed on light backgrounds.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of the background of buttons in the highlighted state configuration.
    /// - Returns: The palette color used for the background of buttons in the highlighted state configuration displayed on light backgrounds.
    class func highlightedButton(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.steelGray
        case .dark:
            return Palette.silver
        }
    }
    
    /// Returns the palette color used for the background of buttons in the disabled state configuration displayed on light backgrounds.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of the background of buttons in the disabled state configuration.
    /// - Returns: The palette color used for the background of buttons in the disabled state configuration displayed on light backgrounds.
    class func disabledButton(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.groupedGray
        case .dark:
            return Palette.scrollGray
        }
    }
    
    // MARK: Inverted
    
    /// Returns the palette color used for the background of buttons in the default state configuration displayed on dark backgrounds.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of the background of buttons in the default state configuration.
    /// - Returns: The palette color used for the background of buttons in the default state configuration displayed on dark backgrounds.
    class func invertedNormalButton(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.white
        case .dark:
            return Palette.black
        }
    }
    
    /// Returns the palette color used for the background of buttons in the highlighted state configuration displayed on dark backgrounds.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of the background of buttons in the highlighted state configuration.
    /// - Returns: The palette color used for the background of buttons in the highlighted state configuration displayed on dark backgrounds.
    class func invertedHighlightedButton(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.silver
        case .dark:
            return Palette.steelGray
        }
    }
    
    /// Returns the palette color used for the background of buttons in the disabled state configuration displayed on dark backgrounds.
    ///
    /// - Parameters:
    ///   - theme: The theme for which to determine the color of the background of buttons in the disabled state configuration.
    /// - Returns: The palette color used for the background of buttons in the disabled state configuration displayed on dark backgrounds.
    class func invertedDisabledButton(for theme: Theme) -> UIColor {
        switch theme {
        case .light:
            return Palette.scrollGray
        case .dark:
            return Palette.groupedGray
        }
    }
}

// MARK: - Nested Types

private extension UIColor {
    
    struct Palette {
        
        static let white = UIColor.white
        
        static let mulberryRed = UIColor(red: 197.0 / 255.0,
                                         green: 81.0 / 255.0,
                                         blue: 82.0 / 255.0,
                                         alpha: 1.0)
        
        static let fireBushOrange = UIColor(red: 225.0 / 255.0,
                                            green: 148.0 / 255.0,
                                            blue: 51.0 / 255.0,
                                            alpha: 1.0)
        
        static let canaryYellow = UIColor(red: 255.0 / 255.0,
                                          green: 252.0 / 255.0,
                                          blue: 120.0 / 255.0,
                                          alpha: 1.0)
        
        static let saffronYellow = UIColor(red: 242.0 / 255.0,
                                           green: 190.0 / 255.0,
                                           blue: 46.0 / 255.0,
                                           alpha: 1.0)
        
        static let wasabiGreen = UIColor(red: 102.0 / 255.0,
                                         green: 255.0 / 255.0,
                                         blue: 102.0 / 255.0,
                                         alpha: 1.0)
        
        static let sushiGreen = UIColor(red: 118.0 / 255.0,
                                        green: 184.0 / 255.0,
                                        blue: 59.0 / 255.0,
                                        alpha: 1.0)
        
        static let ceruleanBlue = UIColor(red: 0.0 / 255.0,
                                          green: 158.0 / 255.0,
                                          blue: 220.0 / 255.0,
                                          alpha: 1.0)
        
        static let cannonPurple = UIColor(red: 147.0 / 255.0,
                                          green: 78.0 / 255.0,
                                          blue: 132.0 / 255.0,
                                          alpha: 1.0)
        
        static let steelGray = UIColor(white: 121.0 / 255.0,
                                       alpha: 1.0)
        
        static let scrollGray = UIColor(red: 111.0 / 255.0,
                                        green: 113.0 / 255.0,
                                        blue: 121.0 / 255.0,
                                        alpha: 1.0)
        
        static let silver = UIColor(white: 204.0 / 255.0,
                                    alpha: 1.0)
        
        static let groupedGray = UIColor(red: 239.0 / 255.0,
                                         green: 239.0 / 255.0,
                                         blue: 241.0 / 255.0,
                                         alpha: 1.0)
        
        static let black = UIColor(white: 34.0 / 255.0,
                                   alpha: 1.0)
    }
}
