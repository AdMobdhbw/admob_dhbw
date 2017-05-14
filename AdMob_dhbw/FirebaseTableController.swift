//
//  FirebaseTableController.swift
//  AdMob_dhbw
//
//  Created by Marco Stierle on 12.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit

    var selectedItem: String!

class FirebaseTableController: BannerAD {
    
    // MARK: - Variables
    
    @IBOutlet weak var firebaseTableView: UITableView!
    
    var firebaseItems = FirebaseItems()
    
    var lastSelection: IndexPath!
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firebaseTableView.rowHeight = UITableViewAutomaticDimension
        firebaseTableView.estimatedRowHeight = 40
        firebaseItems.itemDictionary = [
            "Get Started": firebaseItems.getStarted, "Analytics": firebaseItems.analytics, "Cloud Messaging": firebaseItems.cloudMessaging, "Cloud Functions": firebaseItems.cloudFunctions, "Authentication": firebaseItems.authentication, "Realtime Database": firebaseItems.realtimeDatabase, "Storage": firebaseItems.storage, "Hosting": firebaseItems.hosting, "Test Lab": firebaseItems.testLab, "Crash Reporting": firebaseItems.crashReporting, "Remote Config": firebaseItems.remoteConfig, "App Indexing": firebaseItems.appIndexing, "Dynamic Links": firebaseItems.dynamicLinks, "Invites": firebaseItems.invites, "AdWords": firebaseItems.adWords, "AdMob": firebaseItems.adMob
        ]

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        firebaseTableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return firebaseItems.sections[section]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return firebaseItems.items.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firebaseItems.items[section].count
    }
    
    private struct Storyboard {
        static let cellReuseIdentifier = "FirebaseCell"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = firebaseTableView.dequeueReusableCell(withIdentifier: Storyboard.cellReuseIdentifier, for: indexPath) as UITableViewCell
        
        // Configure cell...
        let item = firebaseItems.items[indexPath.section][indexPath.row]
        cell.textLabel?.text = item

        if (firebaseItems.cellState[indexPath.section][indexPath.row]) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if lastSelection != nil {
            firebaseTableView.cellForRow(at: lastSelection)?.accessoryType = .none
            firebaseItems.cellState[lastSelection.section][lastSelection.row] = false
        }
        
        firebaseTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        firebaseItems.cellState[indexPath.section][indexPath.row] = true
        selectedItem = firebaseTableView.cellForRow(at: indexPath)!.textLabel!.text!
        lastSelection = indexPath
        firebaseTableView.deselectRow(at: indexPath, animated: true)
    }
    
}
