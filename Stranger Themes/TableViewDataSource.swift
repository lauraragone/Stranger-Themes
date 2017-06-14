//
//  TableViewDataSource.swift
//  Stranger Themes
//
//  Created by Laura on 2/10/17.
//  Copyright © 2017 Laura Ragone. All rights reserved.
//

import UIKit

/// A rudiemtary table view data source displaying one section containing a fixed number of cells.
final class TableViewDataSource: NSObject {
    
    // MARK: - Properties
    
    /// A closure for cell creation and configuration, returning a fully configured table view cell.
    fileprivate let cellConfiguration: CellConfiguration
    
    /// The theme for which to configure cell colors.
    fileprivate let theme: Theme
    
    /// An initializer for the data source that takes a cell configuration and a theme.
    ///
    /// - Parameters:
    ///   - cellConfiguration: A closure to create and configure the cell.
    ///   - theme: The visual appearance of cells.
    init(cellConfiguration: @escaping CellConfiguration, theme: Theme) {
        self.cellConfiguration = cellConfiguration
        self.theme = theme
    }
}

// MARK: - UITableViewDataSource

extension TableViewDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection sectionIndex: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellConfiguration(tableView, indexPath, theme)
    }
}

// MARK: - Nested Types

extension TableViewDataSource {
    
    /// A closure for cell creation and configuration.
    ///
    /// - Parameters:
    ///   - tableView: The table view containing the cell to configure.
    ///   - indexPath: The index path of the cell to configure.
    /// - Returns: A fully configured table view cell.
    typealias CellConfiguration = (_ tableView: UITableView, _ indexPath: IndexPath, _ theme: Theme) -> UITableViewCell
}
