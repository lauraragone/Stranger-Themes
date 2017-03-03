//
//  TableViewCellCreator.swift
//  Stranger Themes
//
//  Created by Laura on 2/12/17.
//  Copyright © 2017 Laura Ragone. All rights reserved.
//

import UIKit

/// The cell creator responsible for creating cells to be displayed by a table view.
final class TableViewCellCreator {
    
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
    init(tableView: UITableView) {
        registerCellTypes(for: tableView)
    }
}

// MARK: - TableViewCellCreator

extension TableViewCellCreator {
    
    /// Returns a configured cell for display.
    ///
    /// - Parameters:
    ///   - tableView: The table view within which the cell should be displayed.
    ///   - indexPath: The index path at which to display the cell.
    ///   - theme: The theme for which the cell is configured.
    /// - Returns: A configured cell for display.
    func cell(tableView: UITableView, indexPath: IndexPath, theme: Theme) -> UITableViewCell {
        return {
            switch (indexPath.section, indexPath.row) {
            case (0, 0):
                return hawkinsCell(tableView: tableView, indexPath: indexPath, theme: theme)
            case (0, 1):
                return upsideDownCell(tableView: tableView, indexPath: indexPath, theme: theme)
            default:
                assertionFailure("Please configure the data source to support the display cells at this index path.")
                return nil
            }
        }() ?? UITableViewCell()
    }
}

// MARK: Private

private extension TableViewCellCreator {

    func registerCellTypes(for tableView: UITableView) {
        tableView.register(ColorUpdatableTableViewCell.self, forCellReuseIdentifier: ReuseIdentifier.colorUpdatableCell)
    }
    
    func hawkinsCell(tableView: UITableView, indexPath: IndexPath, theme: Theme) -> ColorUpdatableTableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.colorUpdatableCell, for: indexPath) as? ColorUpdatableTableViewCell else {
            assertionFailure("Please make sure that the correct cell is registered in the table view.")
            return nil
        }
         cell.viewModel = ColorUpdatableTableViewCell.ViewModel(theme: theme, title: "Hawkins, Indiana", subtitle: "A small town with a terrible secret.")
        cell.tapHandler = {
            CustomNotification.didChangeColorTheme.post(userInfo: Theme.light)
        }
        
        return cell
    }
    
    func upsideDownCell(tableView: UITableView, indexPath: IndexPath, theme: Theme) -> ColorUpdatableTableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.colorUpdatableCell, for: indexPath) as? ColorUpdatableTableViewCell else {
            assertionFailure("Please make sure that the correct cell is registered in the table view.")
            return nil
        }
        cell.viewModel = ColorUpdatableTableViewCell.ViewModel(theme: theme, title: "The Upside Down", subtitle: "A mysterious realm bathed in darkness.")
        cell.tapHandler = {
            CustomNotification.didChangeColorTheme.post(userInfo: Theme.dark)
        }
        return cell
    }
}
