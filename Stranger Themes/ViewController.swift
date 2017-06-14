//
//  ViewController.swift
//  Stranger Themes
//
//  Created by Laura Ragone on 2/10/17.
//  Copyright © 2017 Laura Ragone. All rights reserved.
//

import UIKit

/// A rudimentary view controller displaying an image and two buttons.
final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    /// An image view displaying the Stranger Theme's logo as a template image.
    @IBOutlet fileprivate weak var imageView: UIImageView!
    
    /// A button used to reconfigure the view to the `.light` theme.
    @IBOutlet fileprivate weak var lightButton: UIButton!
    
    /// A button used to reconfigure the view to the `.dark` theme.
    @IBOutlet fileprivate weak var darkButton: UIButton!
    
    // MARK: - ColorUpdatable
    
    var theme: Theme = .light {
        didSet {
            guard oldValue != theme else { return }
            updateColors(for: theme)
        }
    }
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDidChangeColorThemeObserver()
        setUpNavigationTitle()
        setUpButtons()
        updateColors(for: theme)
    }
}

// MARK: - ViewController

private extension ViewController {
    
    func setUpNavigationTitle() {
        navigationItem.title = "View Demo"
    }
    
    func setUpButtons() {
        lightButton.setUpButton()
        darkButton.setUpButton()
    }
    
    @IBAction func lightButtonTapped(sender: UIButton) {
        CustomNotification.didChangeColorTheme.post(userInfo: Theme.light)
    }
    
    @IBAction func darkButtonTapped(sender: UIButton) {
        CustomNotification.didChangeColorTheme.post(userInfo: Theme.dark)
    }
}

// MARK: - ColorUpdatable

extension ViewController: ColorUpdatable {
    
    func updateColors(for theme: Theme) {
        view.backgroundColor = .contentBackground(for: theme)
        imageView.tintColor = .brand(for: theme)
        lightButton.configureColors(for: theme)
        darkButton.configureColors(for: theme)
        navigationController?.navigationBar.updateColors(for: theme)
        tabBarController?.tabBar.updateColors(for: theme)
    }
}

// MARK: - UIButton

private extension UIButton {
    
    func setUpButton() {
        layer.borderWidth = 2.0
        layer.cornerRadius = 4.0
    }
    
    func configureColors(for theme: Theme) {
        setTitleColor(.normalButton(for: theme), for: .normal)
        setTitleColor(.highlightedButton(for: theme), for: .highlighted)
        setTitleColor(.disabledButton(for: theme), for: .disabled)
        
        layer.borderColor = UIColor.normalButton(for: theme).cgColor
    }
}
