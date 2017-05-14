//
//  DetailTableController.swift
//  AdMob_dhbw
//
//  Created by Marco Stierle on 14.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit

class DetailTableController: BannerAD {
    
    // MARK: - Variables
    
    @IBOutlet weak var detailTableView: UITableView!
    
    var firebaseItems = FirebaseItems()
    
    var lastSelection: IndexPath!
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTableView.rowHeight = UITableViewAutomaticDimension
        detailTableView.estimatedRowHeight = 40
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        detailTableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firebaseItems.getDetailItem(selectedItem)!.count
    }
    
    private struct Storyboard {
        static let cellReuseIdentifier = "DetailCell"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = detailTableView.dequeueReusableCell(withIdentifier: Storyboard.cellReuseIdentifier, for: indexPath) as UITableViewCell
        
        // Configure cell...
        let item = firebaseItems.getDetailItem(selectedItem)![indexPath.row]
        cell.textLabel?.text = item
        
        /*if (firebaseItems.cellState[indexPath.section][indexPath.row]) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }*/
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (lastSelection != nil) {
            detailTableView.cellForRow(at: lastSelection)?.accessoryType = .none
            //firebaseItems.cellState[lastSelection.section][lastSelection.row] = false
        }
        
        detailTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        //firebaseItems.cellState[indexPath.section][indexPath.row] = true
        lastSelection = indexPath
        detailTableView.deselectRow(at: indexPath, animated: true)
    }

}
