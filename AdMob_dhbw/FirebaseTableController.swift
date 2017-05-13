//
//  FirebaseTableController.swift
//  AdMob_dhbw
//
//  Created by Marco Stierle on 12.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit

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
        
        let item = firebaseItems.items[indexPath.section][indexPath.row]
        cell.textLabel?.text = item
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (lastSelection != nil) {
            firebaseTableView.cellForRow(at: lastSelection)?.accessoryType = .none
        }
        
        firebaseTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        lastSelection = indexPath
        firebaseTableView.deselectRow(at: indexPath, animated: true)
    }
    
}
