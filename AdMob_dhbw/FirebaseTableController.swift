//
//  FirebaseTableController.swift
//  AdMob_dhbw
//
//  Created by Marco Stierle on 12.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit

var selectedItem = ""

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
        
        // reload data of the table every time it will appear
        firebaseTableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    // set section titles
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return firebaseItems.sections[section]
    }
    
    // set number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return firebaseItems.items.count
    }
    
    // set number of rows in each section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firebaseItems.items[section].count
    }
    
    // define cellReuseIdentifier
    private struct Storyboard {
        static let cellReuseIdentifier = "FirebaseCell"
    }
    
    // load the cells which have to be displayed
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = firebaseTableView.dequeueReusableCell(withIdentifier: Storyboard.cellReuseIdentifier, for: indexPath) as UITableViewCell
        
        // Configure cell...
        let item = firebaseItems.items[indexPath.section][indexPath.row]
        cell.textLabel?.text = item

        // get cell state from FirebaseItems and set accessoryType
        if (firebaseItems.cellState[indexPath.section][indexPath.row]) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    // called when a cell is tapped on
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // reset accessory type & cell state of last selected cell
        if lastSelection != nil {
            firebaseTableView.cellForRow(at: lastSelection)?.accessoryType = .none
            firebaseItems.cellState[lastSelection.section][lastSelection.row] = false
        }
        
        // set accessory type & cell state of the selected cell
        firebaseTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        firebaseItems.cellState[indexPath.section][indexPath.row] = true
        selectedItem = firebaseTableView.cellForRow(at: indexPath)!.textLabel!.text!
        lastSelection = indexPath
        firebaseTableView.deselectRow(at: indexPath, animated: true)
    }
    
}
