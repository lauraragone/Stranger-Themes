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
    
    fileprivate weak var delegate: TableViewCellActionDelegate?
    
    // MARK: - Initializers
    
    /// Sets up the initial cell configuration necessary on the table view. Registers the appropriate cell types.
    ///
    /// - Parameters:
    ///   - tableView: The table view upon which to register the cell types.
    ///   - tableViewCellActionDelegate: An optional delegate to handle taps to cells created by this cell creator.
    init(tableView: UITableView, tableViewCellActionDelegate: TableViewCellActionDelegate?) {
        self.delegate = tableViewCellActionDelegate
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
                return lightCell(tableView: tableView, indexPath: indexPath, theme: theme)
            case (0, 1):
                return darkCell(tableView: tableView, indexPath: indexPath, theme: theme)
            default:
                assertionFailure("Please configure the data source to support the display cells at this index path.")
                return nil
            }
        }() ?? UITableViewCell()
    }
}

// MARK: - Nested Types

private extension TableViewCellCreator {
    
    /// A struct defining cell reuse identifying strings.
    struct ReuseIdentifier {
        
        /// The reuse identifier corresponding to a color updatable cell.
        static let colorUpdatableCell = "colorUpdatableCellReuseIdentifier"
    }
}

// MARK: Private

private extension TableViewCellCreator {

    func registerCellTypes(for tableView: UITableView) {
        tableView.register(ColorUpdatableTableViewCell.self, forCellReuseIdentifier: ReuseIdentifier.colorUpdatableCell)
    }
    
    func lightCell(tableView: UITableView, indexPath: IndexPath, theme: Theme) -> ColorUpdatableTableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.colorUpdatableCell, for: indexPath) as? ColorUpdatableTableViewCell else {
            assertionFailure("Please make sure that the correct cell is registered in the table view.")
            return nil
        }
        cell.viewModel = ColorUpdatableTableViewCell.ViewModel(theme: theme, title: "Light", subtitle: "Tap this cell to activate the light theme")
        cell.selectionStyle = .default
        
        cell.tapHandler = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.tableViewCellCreatorDidSelectLightMode(cellCreator: strongSelf)
        }
        
        return cell
    }
    
    func darkCell(tableView: UITableView, indexPath: IndexPath, theme: Theme) -> ColorUpdatableTableViewCell? {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifier.colorUpdatableCell, for: indexPath) as? ColorUpdatableTableViewCell else {
            assertionFailure("Please make sure that the correct cell is registered in the table view.")
            return nil
        }
        cell.viewModel = ColorUpdatableTableViewCell.ViewModel(theme: theme, title: "Dark", subtitle: "Tap this cell to activate the dark theme")
        cell.selectionStyle = .default
        
        cell.tapHandler = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.tableViewCellCreatorDidSelectDarkMode(cellCreator: strongSelf)
        }
        
        return cell
    }
}

// MARK: TableViewCellActionDelegate

protocol TableViewCellActionDelegate: class {
    
    /// A delegate method that is called when the cell of a character never having traveled to the Upside Down is tapped.
    ///
    /// - Parameter cellCreator: The cell creator that is notifying its delegate.
    func tableViewCellCreatorDidSelectLightMode(cellCreator: TableViewCellCreator)
    
    /// A delegate method that is called when the cell of a character having traveled to the Upside Down is tapped.
    ///
    /// - Parameter cellCreator: The cell creator that is notifying its delegate.
    func tableViewCellCreatorDidSelectDarkMode(cellCreator: TableViewCellCreator)
}

