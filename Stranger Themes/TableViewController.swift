//
//  TableViewController.swift
//  Stranger Themes
//
//  Created by Laura on 2/10/17.
//  Copyright © 2017 Laura Ragone. All rights reserved.
//

import UIKit

/// A simple table view controller displaying a table header and several cells.
final class TableViewController: UITableViewController {

    // MARK: - Properties
    
    /// The object responsible for defining the appearance of table view cells.
    fileprivate lazy var cellCreator: TableViewCellCreator = {
        return TableViewCellCreator(tableView: self.tableView, tableViewCellActionDelegate: self)
    }()
    
    /// The data source responsbile for populating the table view.
    fileprivate var dataSource: TableViewDataSource?
    
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
    
    // MARK: - UITableViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationTitle()
        setUpTableView()
        updateDataSource()
        updateColors(for: theme)
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: false)
        }
        if let cell = tableView.cellForRow(at: indexPath) as? ColorUpdatableTableViewCell {
            cell.tapHandler?()
        }
    }
}

// MARK: - TableViewController

private extension TableViewController {

    func commonInitialization() {
        registerObservers()
    }
    
    func setUpNavigationTitle() {
        navigationItem.title = "Table View Demo"
    }
    
    func setUpTableView() {
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.delegate = self
    }
    
    func updateDataSource() {
        dataSource = TableViewDataSource(cellConfiguration: cellCreator.cell, theme: theme)
        tableView.dataSource = dataSource
    }
    
    func registerObservers() {
        addDidChangeColorThemeObserver()
    }
}

// MARK: - ColorUpdatable

extension TableViewController: ColorUpdatable {
    
    func updateColors(for theme: Theme) {
        view.backgroundColor = .contentBackground(for: theme)
        navigationController?.navigationBar.updateColors(for: theme)
        tabBarController?.tabBar.updateColors(for: theme)
    }
}

// MARK: TableViewCellActionDelegate

extension TableViewController: TableViewCellActionDelegate {
    
    func tableViewCellCreatorDidSelectLightMode(cellCreator: TableViewCellCreator) {
        CustomNotification.didChangeColorTheme.post(userInfo: Theme.light)
    }
    
    func tableViewCellCreatorDidSelectDarkMode(cellCreator: TableViewCellCreator) {
        CustomNotification.didChangeColorTheme.post(userInfo: Theme.dark)
    }
}

