//
//  CollectionViewController.swift
//  Stranger Themes
//
//  Created by Laura Ragone on 2/10/17.
//  Copyright © 2017 Laura Ragone. All rights reserved.
//

import UIKit

/// A simple collection view controller displaying a collection header and several cells.
final class CollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    /// The object responsible for defining the appearance of collection view cells.
    fileprivate lazy var cellCreator: CollectionViewCellCreator = {
        return CollectionViewCellCreator(collectionView: self.collectionView, collectionViewCellActionDelegate: self)
    }()
    
    /// The data source responsbile for populating the collection view.
    fileprivate var dataSource: CollectionViewDataSource?
    
    // MARK: - ColorUpdatable
    
    var theme: Theme = .light {
        didSet {
            guard oldValue != theme else { return }
            updateDataSource()
        }
    }

    // MARK: - Initializers

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInitialization()
    }
    
    // MARK: - UICollectionViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationTitle()
        setUpCollectionView()
        updateDataSource()
        updateColors(for: theme)
    }
    
    // MARK: - UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        defer {
            collectionView.deselectItem(at: indexPath, animated: false)
        }
        if let cell = collectionView.cellForItem(at: indexPath) as? ColorUpdatableCollectionViewCell {
            cell.tapHandler?()
        }
    }
}

// MARK: - CollectionViewController

private extension CollectionViewController {

    func commonInitialization() {
        registerObservers()
    }
    
    func setUpNavigationTitle() {
        navigationItem.title = "Collection View Demo"
    }
    
    func setUpCollectionView() {
        collectionView?.delegate = self
    }
    
    func updateDataSource() {
        dataSource = CollectionViewDataSource(cellConfiguration: cellCreator.cell, theme: theme)
        collectionView?.dataSource = dataSource
    }
    
    func registerObservers() {
        addDidChangeColorThemeObserver()
    }
}

// MARK: - ColorUpdatable

extension CollectionViewController: ColorUpdatable {
    
    func updateColors(for theme: Theme) {
        view.backgroundColor = .contentBackground(for: theme)
        collectionViewLayout.collectionView?.backgroundColor = .contentBackground(for: theme)
        navigationController?.navigationBar.updateColors(for: theme)
        tabBarController?.tabBar.updateColors(for: theme)
    }
}

// MARK: CollectionViewCellActionDelegate

extension CollectionViewController: CollectionViewCellActionDelegate {
    
    func collectionViewCellCreatorDidSelectLightMode(cellCreator: CollectionViewCellCreator) {
        CustomNotification.didChangeColorTheme.post(userInfo: Theme.light)
    }
    
    func collectionViewCellCreatorDidSelectDarkMode(cellCreator: CollectionViewCellCreator) {
        CustomNotification.didChangeColorTheme.post(userInfo: Theme.dark)
    }
}
