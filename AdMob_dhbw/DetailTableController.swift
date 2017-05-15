//
//  DetailTableController.swift
//  AdMob_dhbw
//
//  Created by Marco Stierle on 14.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit

var selectedDetailItem: Int!

class DetailTableController: StickyBannerAD {
    
    // MARK: - Variables
    
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var navigationBarItem: UINavigationItem!
    
    var detailItems = DetailItems()
    
    var lastSelection: IndexPath!
    
    var lastSelectedItem = ""
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTableView.rowHeight = UITableViewAutomaticDimension
        detailTableView.estimatedRowHeight = 40
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationBarItem.title = selectedItem
        
        // reinitialize detailCellState if another cell was selected in FirebaseTableView
        if lastSelectedItem != selectedItem {
            let detailItemsCount = detailItems.getDetailItem(selectedItem)!.count
            
            if detailItems.detailCellState != nil {
                detailItems.detailCellState = nil
                detailItems.detailCellState = [false]
                for _ in 0...detailItemsCount-1 {
                    detailItems.detailCellState.append(false)
                }
            } else {
                detailItems.detailCellState = [false]
                for _ in 0...detailItemsCount-1 {
                    detailItems.detailCellState.append(false)
                }
            }
        }
        lastSelectedItem = selectedItem
        
        // reload data of the table every time it will appear
        detailTableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    // set number of rows in each section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailItems.getDetailItem(selectedItem)!.count
    }
    
    // define cellReuseIdentifier
    private struct Storyboard {
        static let cellReuseIdentifier = "DetailCell"
    }
    
    // load the cells which have to be displayed
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = detailTableView.dequeueReusableCell(withIdentifier: Storyboard.cellReuseIdentifier, for: indexPath) as UITableViewCell
        
        // Configure cell...
        let item = detailItems.getDetailItem(selectedItem)![indexPath.row]
        cell.textLabel?.text = item
        
        // get cell state from DetailItems and set accessoryType
        if (detailItems.detailCellState[indexPath.row]) {
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
            detailTableView.cellForRow(at: lastSelection)?.accessoryType = .none
            detailItems.detailCellState[lastSelection.row] = false
        }
        
        // set accessory type & cell state of the selected cell
        detailTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        detailItems.detailCellState[indexPath.row] = true
        selectedDetailItem = indexPath.row
        lastSelection = indexPath
        detailTableView.deselectRow(at: indexPath, animated: true)
    }

}
