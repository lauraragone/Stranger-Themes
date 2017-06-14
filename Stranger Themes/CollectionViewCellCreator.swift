//
//  CollectionViewCellCreator.swift
//  Stranger Themes
//
//  Created by Laura Ragone on 2/10/17.
//  Copyright © 2017 Laura Ragone. All rights reserved.
//

import UIKit

/// The cell creator responsible for creating cells to be displayed by a collection view.
final class CollectionViewCellCreator {
    
    // MARK: - Properties
    
    fileprivate weak var delegate: CollectionViewCellActionDelegate?
    
    // MARK: - Initializers
    
    /// Sets up the initial cell configuration necessary on the collection view. Registers the appropriate cell types.
    ///
    /// - Parameters:
    ///   - collectionView: The collection view upon which to register the cell types.
    ///   - collectionViewCellActionDelegate: An optional delegate to handle taps to cells created by this cell creator.
    init(collectionView: UICollectionView?, collectionViewCellActionDelegate: CollectionViewCellActionDelegate?) {
        self.delegate = collectionViewCellActionDelegate
        registerCellTypes(for: collectionView)
    }
}

// MARK: - CollectionViewCellCreator

extension CollectionViewCellCreator {

    /// Returns a configured cell for display.
    ///
    /// - Parameters:
    ///   - collectionView: The collection view within which the cell should be displayed.
    ///   - indexPath: The index path at which to display the cell.
    ///   - theme: The theme for which the cell is configured.
    /// - Returns: A configured cell for display.
    func cell(collectionView: UICollectionView, indexPath: IndexPath, theme: Theme) -> UICollectionViewCell {
        return {
            switch (indexPath.section, indexPath.row) {
            case (0, 0):
                return lightCell(collectionView: collectionView, indexPath: indexPath, theme: theme)
            case (0, 1):
                return darkCell(collectionView: collectionView, indexPath: indexPath, theme: theme)
            default:
                assertionFailure("Please configure the data source to support the display cells at this index path.")
                return nil
            }
            }() ?? UICollectionViewCell()
    }
}

// MARK: - Nested Types

private extension CollectionViewCellCreator {
    
    /// A struct defining cell reuse identifying strings.
    struct ReuseIdentifier {
        
        /// The reuse identifier corresponding to a color updatable cell.
        static let colorUpdatableCell = "colorUpdatableCellReuseIdentifier"
    }
}

// MARK: Private

private extension CollectionViewCellCreator {
    
    func registerCellTypes(for collectionView: UICollectionView?) {
        collectionView?.register(UINib(nibName: "ColorUpdatableCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: ReuseIdentifier.colorUpdatableCell)
    }
    
    func lightCell(collectionView: UICollectionView, indexPath: IndexPath, theme: Theme) -> ColorUpdatableCollectionViewCell? {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.colorUpdatableCell, for: indexPath) as? ColorUpdatableCollectionViewCell else {
            assertionFailure("Please make sure that the correct cell is registered in the table view.")
            return nil
        }
        let image: UIImage = {
            switch theme {
            case .light:
                return #imageLiteral(resourceName: "pink-bulb--lit")
            case .dark:
                return #imageLiteral(resourceName: "pink-bulb--off")
            }
        }()
        cell.viewModel = ColorUpdatableCollectionViewCell.ViewModel(theme: theme, title: "Light", image: image)
        
        cell.tapHandler = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.collectionViewCellCreatorDidSelectLightMode(cellCreator: strongSelf)
        }
        
        return cell
    }
    
    func darkCell(collectionView: UICollectionView, indexPath: IndexPath, theme: Theme) -> ColorUpdatableCollectionViewCell? {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.colorUpdatableCell, for: indexPath) as? ColorUpdatableCollectionViewCell else {
            assertionFailure("Please make sure that the correct cell is registered in the table view.")
            return nil
        }
        let image: UIImage = {
            switch theme {
            case .light:
                return #imageLiteral(resourceName: "green-bulb--off")
            case .dark:
                return #imageLiteral(resourceName: "green-bulb--lit")
            }
        }()
        cell.viewModel = ColorUpdatableCollectionViewCell.ViewModel(theme: theme, title: "Dark", image: image)
        
        cell.tapHandler = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.collectionViewCellCreatorDidSelectDarkMode(cellCreator: strongSelf)
        }
        
        return cell
    }
}

// MARK: CollectionViewCellActionDelegate

protocol CollectionViewCellActionDelegate: class {
    
    /// A delegate method that is called when the cell of a character never having traveled to the Upside Down is tapped.
    ///
    /// - Parameter cellCreator: The cell creator that is notifying its delegate.
    func collectionViewCellCreatorDidSelectLightMode(cellCreator: CollectionViewCellCreator)
    
    /// A delegate method that is called when the cell of a character having traveled to the Upside Down is tapped.
    ///
    /// - Parameter cellCreator: The cell creator that is notifying its delegate.
    func collectionViewCellCreatorDidSelectDarkMode(cellCreator: CollectionViewCellCreator)
}
