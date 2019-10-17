//
//  ColorUpdatableTableViewCell.swift
//  Stranger Themes
//
//  Created by Laura on 2/10/17.
//  Copyright © 2017 Laura Ragone. All rights reserved.
//

import UIKit

/// A cell capable of updating its colors in response to theme changes.
final class ColorUpdatableTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    /// The view model enabling the cell to configure its views.
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            textLabel?.text = viewModel.title
            detailTextLabel?.text = viewModel.subtitle
            theme = viewModel.theme
        }
    }
    
    /// A closure to be called when the cell is selected.
    var tapHandler: (() -> Void)?
    
    // MARK: - ColorUpdatable
    
    var theme: Theme = .light {
        didSet {
            guard oldValue != theme else { return }
            updateColors(for: theme)
        }
    }
    
    // MARK: - Initializers
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInitialization()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        commonInitialization()
    }
}

// MARK: - Nested Types

extension ColorUpdatableTableViewCell {
    
    /// The view model enabling the cell to configure its views.
    struct ViewModel {
        
        /// The theme for which to dictate the cell's appearance.
        let theme: Theme
        
        /// The title text to display prominently.
        let title: String
        
        /// The subtitle text to display alongside the title text.
        let subtitle: String
    }
}

// MARK: - ColorUpdatableCell

private extension ColorUpdatableTableViewCell {
    
    func commonInitialization() {
        updateColors(for: theme)
    }
}

// MARK: - ColorUpdatable

extension ColorUpdatableTableViewCell: ColorUpdatable {
    
    func updateColors(for theme: Theme) {
        textLabel?.textColor = .primaryText(for: theme)
        detailTextLabel?.textColor = .secondaryText(for: theme)
        
        textLabel?.configureBackgroundColor(for: theme)
        detailTextLabel?.configureBackgroundColor(for: theme)
        
        contentView.backgroundColor = .contentBackground(for: theme)
    }
}

// MARK: UILabel

private extension UILabel {
    
    func configureBackgroundColor(for theme: Theme) {
        backgroundColor = .contentBackground(for: theme)
    }
}
