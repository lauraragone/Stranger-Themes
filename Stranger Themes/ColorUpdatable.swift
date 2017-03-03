//
//  ColorUpdatable.swift
//  Stranger Themes
//
//  Created by Laura Ragone on 2/10/17.
//  Copyright © 2017 Laura Ragone. All rights reserved.
//

/// A protocol which denotes types which can update their colors.
protocol ColorUpdatable {
    
    /// The theme for which to update colors.
    var theme: Theme { get set }
    
    /// A function that is called when colors should be updated.
    ///
    /// - Parameter theme: The theme for which to update colors.
    func updateColors(for theme: Theme)
}
