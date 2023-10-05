//
//  ViewController.swift
//  Today
//
//  Created by Roberto Liccardo on 04/10/23.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, String>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, String>

    var dataSource: DataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting the collectionView Layout
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        // Cell registration specifies how to configure the content and appearance of a cell
        let cellRegistration = UICollectionView.CellRegistration { (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
            let reminder = Reminder.sampleData[indexPath.item]
            var content = cell.defaultContentConfiguration()
            content.text = reminder.title
            cell.contentConfiguration = content
        }
        
        // The source of data for our collection view are the cells
        dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        // Diffable data sources manage the state of your data with snapshots.
        // A snapshot represents the state of your data at a specific point in time.
        // To display data using a snapshot, you’ll create the snapshot,
        // populate the snapshot with the state of data that you want to display,
        // and then apply the snapshot in the user interface.
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(Reminder.sampleData.map { $0.title })
        dataSource.apply(snapshot)

        // Setting the collectionView DataSource
        collectionView.dataSource = dataSource
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        // UICollectionLayoutListConfiguration: A predefined configuration of how the list should appear
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }

}
