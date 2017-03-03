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
    
    /// A struct defining cell reuse identifying strings.
    fileprivate struct ReuseIdentifier {
        
        /// The reuse identifier corresponding to a color updatable cell.
        static let colorUpdatableCell = "colorUpdatableCellReuseIdentifier"
    }
    
    // MARK: - Initializers
    
    /// Sets up the initial cell configuration necessary on the table view. Registers the appropriate cell types.
    ///
    /// - Parameter tableView: The table view upon which to register the cell types.
    init(collectionView: UICollectionView) {
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
                return elevenCell(collectionView: collectionView, indexPath: indexPath, theme: theme)
            case (0, 1):
                return willCell(collectionView: collectionView, indexPath: indexPath, theme: theme)
            case (0, 2):
                return mikeCell(collectionView: collectionView, indexPath: indexPath, theme: theme)
            case (0, 3):
                return dustinCell(collectionView: collectionView, indexPath: indexPath, theme: theme)
            case (0, 4):
                return lucasCell(collectionView: collectionView, indexPath: indexPath, theme: theme)
            case (0, 5):
                return hopperCell(collectionView: collectionView, indexPath: indexPath, theme: theme)
            case (0, 6):
                return joyceCell(collectionView: collectionView, indexPath: indexPath, theme: theme)
            case (0, 7):
                return johnathanCell(collectionView: collectionView, indexPath: indexPath, theme: theme)
            case (0, 8):
                return nancyCell(collectionView: collectionView, indexPath: indexPath, theme: theme)
            case (0, 9):
                return demigorgenCell(collectionView: collectionView, indexPath: indexPath, theme: theme)
            default:
                assertionFailure("Please configure the data source to support the display cells at this index path.")
                return nil
            }
            }() ?? UICollectionViewCell()
    }
}

// MARK: Private

private extension CollectionViewCellCreator {
    
    func registerCellTypes(for collectionView: UICollectionView) {
        collectionView.register(UINib(nibName: "ColorUpdatableCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: ReuseIdentifier.colorUpdatableCell)
    }
    
    func elevenCell(collectionView: UICollectionView, indexPath: IndexPath, theme: Theme) -> ColorUpdatableCollectionViewCell? {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.colorUpdatableCell, for: indexPath) as? ColorUpdatableCollectionViewCell else {
            assertionFailure("Please make sure that the correct cell is registered in the table view.")
            return nil
        }
        let image: UIImage = {
            switch theme {
            case .light:
                return UIImage(named: "Eleven Light")!
            case .dark:
                return UIImage(named: "Eleven Dark")!
            }
        }()
        cell.viewModel = ColorUpdatableCollectionViewCell.ViewModel(theme: theme, name: "Eleven", image: image)
        cell.tapHandler = {
            CustomNotification.didChangeColorTheme.post(userInfo: Theme.dark)
        }
        
        return cell
    }
    
    func willCell(collectionView: UICollectionView, indexPath: IndexPath, theme: Theme) -> ColorUpdatableCollectionViewCell? {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.colorUpdatableCell, for: indexPath) as? ColorUpdatableCollectionViewCell else {
            assertionFailure("Please make sure that the correct cell is registered in the table view.")
            return nil
        }
        cell.viewModel = ColorUpdatableCollectionViewCell.ViewModel(theme: theme, name: "Will", image: UIImage(named: "Will")!)

        cell.tapHandler = {
            CustomNotification.didChangeColorTheme.post(userInfo: Theme.dark)
        }
        
        return cell
    }
    
    func mikeCell(collectionView: UICollectionView, indexPath: IndexPath, theme: Theme) -> ColorUpdatableCollectionViewCell? {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.colorUpdatableCell, for: indexPath) as? ColorUpdatableCollectionViewCell else {
            assertionFailure("Please make sure that the correct cell is registered in the table view.")
            return nil
        }
        cell.viewModel = ColorUpdatableCollectionViewCell.ViewModel(theme: theme, name: "Mike", image: UIImage(named: "Mike")!)

        cell.tapHandler = {
            CustomNotification.didChangeColorTheme.post(userInfo: Theme.light)
        }
        
        return cell
    }
    
    func dustinCell(collectionView: UICollectionView, indexPath: IndexPath, theme: Theme) -> ColorUpdatableCollectionViewCell? {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.colorUpdatableCell, for: indexPath) as? ColorUpdatableCollectionViewCell else {
            assertionFailure("Please make sure that the correct cell is registered in the table view.")
            return nil
        }
        cell.viewModel = ColorUpdatableCollectionViewCell.ViewModel(theme: theme, name: "Dustin", image: UIImage(named: "Dustin")!)

        cell.tapHandler = {
            CustomNotification.didChangeColorTheme.post(userInfo: Theme.light)
        }
        
        return cell
    }
    
    func lucasCell(collectionView: UICollectionView, indexPath: IndexPath, theme: Theme) -> ColorUpdatableCollectionViewCell? {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.colorUpdatableCell, for: indexPath) as? ColorUpdatableCollectionViewCell else {
            assertionFailure("Please make sure that the correct cell is registered in the table view.")
            return nil
        }
        cell.viewModel = ColorUpdatableCollectionViewCell.ViewModel(theme: theme, name: "Lucas", image: UIImage(named: "Lucas")!)

        cell.tapHandler = {
            CustomNotification.didChangeColorTheme.post(userInfo: Theme.light)
        }
        
        return cell
    }
    
    func hopperCell(collectionView: UICollectionView, indexPath: IndexPath, theme: Theme) -> ColorUpdatableCollectionViewCell? {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.colorUpdatableCell, for: indexPath) as? ColorUpdatableCollectionViewCell else {
            assertionFailure("Please make sure that the correct cell is registered in the table view.")
            return nil
        }
        cell.viewModel = ColorUpdatableCollectionViewCell.ViewModel(theme: theme, name: "Hopper", image: UIImage(named: "Hopper")!)

        cell.tapHandler = {
            CustomNotification.didChangeColorTheme.post(userInfo: Theme.light)
        }
        
        return cell
    }
    
    func joyceCell(collectionView: UICollectionView, indexPath: IndexPath, theme: Theme) -> ColorUpdatableCollectionViewCell? {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.colorUpdatableCell, for: indexPath) as? ColorUpdatableCollectionViewCell else {
            assertionFailure("Please make sure that the correct cell is registered in the table view.")
            return nil
        }
       cell.viewModel = ColorUpdatableCollectionViewCell.ViewModel(theme: theme, name: "Joyce", image: UIImage(named: "Joyce")!)

        cell.tapHandler = {
            CustomNotification.didChangeColorTheme.post(userInfo: Theme.light)
        }
        
        return cell
    }
    
    func johnathanCell(collectionView: UICollectionView, indexPath: IndexPath, theme: Theme) -> ColorUpdatableCollectionViewCell? {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.colorUpdatableCell, for: indexPath) as? ColorUpdatableCollectionViewCell else {
            assertionFailure("Please make sure that the correct cell is registered in the table view.")
            return nil
        }
        cell.viewModel = ColorUpdatableCollectionViewCell.ViewModel(theme: theme, name: "Johnathan", image: UIImage(named: "Johnathan")!)

        cell.tapHandler = {
            CustomNotification.didChangeColorTheme.post(userInfo: Theme.light)
        }
        
        return cell
    }
    
    func nancyCell(collectionView: UICollectionView, indexPath: IndexPath, theme: Theme) -> ColorUpdatableCollectionViewCell? {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.colorUpdatableCell, for: indexPath) as? ColorUpdatableCollectionViewCell else {
            assertionFailure("Please make sure that the correct cell is registered in the table view.")
            return nil
        }
        cell.viewModel = ColorUpdatableCollectionViewCell.ViewModel(theme: theme, name: "Nancy", image: UIImage(named: "Nancy")!)

        cell.tapHandler = {
            CustomNotification.didChangeColorTheme.post(userInfo: Theme.dark)
        }
        
        return cell
    }
    
    func demigorgenCell(collectionView: UICollectionView, indexPath: IndexPath, theme: Theme) -> ColorUpdatableCollectionViewCell? {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifier.colorUpdatableCell, for: indexPath) as? ColorUpdatableCollectionViewCell else {
            assertionFailure("Please make sure that the correct cell is registered in the table view.")
            return nil
        }
        let image: UIImage = {
            switch theme {
            case .light:
                return UIImage(named: "Demigorgen Light")!
            case .dark:
                return UIImage(named: "Demigorgen Dark")!
            }
        }()
        cell.viewModel = ColorUpdatableCollectionViewCell.ViewModel(theme: theme, name: "Demigorgen", image: image)

        cell.tapHandler = {
            CustomNotification.didChangeColorTheme.post(userInfo: Theme.dark)
        }
        
        return cell
    }
}
