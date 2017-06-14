//
//  ColorUpdatableCollectionViewCell.swift
//  Stranger Themes
//
//  Created by Laura Ragone on 2/10/17.
//  Copyright © 2017 Laura Ragone. All rights reserved.
//

import UIKit

/// A cell capable of updating its colors in response to theme changes.
final class ColorUpdatableCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    /// The view model enabling the cell to configure its views.
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            titleLabel.text = viewModel.title
            imageView.image = viewModel.image
            theme = viewModel.theme
        }
    }
    
    /// A closure to be called when the cell is selected.
    var tapHandler: (() -> Void)?

    /// An image view displaying a prominent image.
    @IBOutlet fileprivate weak var imageView: UIImageView!

    /// A label displaying prominent title text.
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    
    // MARK: - ColorUpdatable
    
    var theme: Theme = .light {
        didSet {
            guard oldValue != theme else { return }
            updateColors(for: theme)
        }
    }
    
    // MARK: - UINibLoading
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateColors(for: theme)
    }
}

// MARK: - Nested Types

extension ColorUpdatableCollectionViewCell {
    
    /// The view model enabling the cell to configure its views.
    struct ViewModel {
        
        /// The theme for which to dictate the cell's appearance.
        let theme: Theme
        
        /// The name text to display prominently.
        let title: String
        
        /// The image to display alongside the name text.
        let image: UIImage
    }
}

// MARK: - ColorUpdatable

extension ColorUpdatableCollectionViewCell: ColorUpdatable {
    
    func updateColors(for theme: Theme) {
        contentView.backgroundColor = .contentBackground(for: theme)

        titleLabel.backgroundColor = .contentBackground(for: theme)
        titleLabel.textColor = .primaryText(for: theme)
    }
}
