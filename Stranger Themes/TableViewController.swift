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
    
    // MARK: - Nested Types
    
    /// The style of the table view's header.
    ///
    /// - hawkinsIndiana: Displays a small town in Indiana.
    /// - upsideDown: Displays a mysterious realm of darkness.
    enum HeaderStyle {
        
        case hawkinsIndiana
        
        case upsideDown
    }
    
    // MARK: - Properties
    
    /// The style of the table view's header.
    fileprivate var headerStyle: HeaderStyle {
        get {
            switch theme {
            case .light:
                return .hawkinsIndiana
            case .dark:
                return .upsideDown
            }
        }
    }
    
    /// The object responsible for defining the appearance of table view cells.
    fileprivate lazy var cellCreator: TableViewCellCreator = {
        return TableViewCellCreator(tableView: self.tableView)
    }()
    
    /// The data source responsbile for populating the table view.
    var dataSource: TableViewDataSource?
    
    // MARK: - ColorUpdatable
    
    var theme: Theme = .light {
        didSet {
            guard oldValue != theme else { return }
            updateDataSource()
            updateTableHeaderView()
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
        updateTableHeaderView()
        updateDataSource()
        updateColors(for: theme)
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
        navigationItem.title = "Worlds"
    }
    
    func updateTableHeaderView() {
        let image: UIImage? = {
            switch headerStyle {
            case .hawkinsIndiana:
                return UIImage(named: "Hawkins")
            case .upsideDown:
                return UIImage(named: "Upside Down")
            }
        }()
       tableView.tableHeaderView = UIImageView(image: image)
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
    }
}
