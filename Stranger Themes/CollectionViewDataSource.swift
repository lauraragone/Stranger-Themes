//
//  CollectionViewDataSource.swift
//  Stranger Themes
//
//  Created by Laura Ragone on 2/10/17.
//  Copyright © 2017 Laura Ragone. All rights reserved.
//

import UIKit

/// A rudiemtary table view data source displaying one section containing a fixed number of cells.
final class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    // MARK: - Nested Types
    
    /// A closure for cell creation and configuration.
    ///
    /// - Parameters:
    ///   - collectionView: The collection view containing the cell to configure.
    ///   - indexPath: The index path of the cell to configure.
    /// - Returns: A fully configured collection view cell.
    typealias CellConfiguration = (_ collectionView: UICollectionView, _ indexPath: IndexPath, _ theme: Theme) -> UICollectionViewCell
    
    // MARK: - Properties
    
    /// A closure for cell creation and configuration, returning a fully configured table view cell.
    fileprivate let cellConfiguration: CellConfiguration
    
    /// The theme for which to configure cell colors.
    private let theme: Theme
    
    /// An initializer for the data source that takes a cell configuration and a theme.
    ///
    /// - Parameters:
    ///   - cellConfiguration: A closure to create and configure the cell.
    ///   - theme: The visual appearance of cells.
    init(cellConfiguration: @escaping CellConfiguration, theme: Theme) {
        self.cellConfiguration = cellConfiguration
        self.theme = theme
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return cellConfiguration(collectionView, indexPath, theme)
    }
}
