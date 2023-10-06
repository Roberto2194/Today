//
//  ViewController.swift
//  Today
//
//  Created by Roberto Liccardo on 04/10/23.
//

import UIKit

// CollectionViews have three components:
// 1. Data: Diffable Data Source
// 2. Layout: Compositional Layout
// 3. Presentation: Cell View Configuration
class ReminderListViewController: UICollectionViewController {
    // 1. Data: Diffable Data Source
    var dataSource: DataSource!
    var reminders: [Reminder] = Reminder.sampleData

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 2. Layout: Compositional Layout
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        // 3. Presentation: Cell View Configuration
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)

        // The data source for our collection view are the contents of the cells
        // We only configure how one should be in cellRegistration and then use
        // dequeueConfiguredReusableCell in DataSource to make them reusable
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Reminder.ID) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        updateSnapshot()

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
