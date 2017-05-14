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
        
        detailTableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailItems.getDetailItem(selectedItem)!.count
    }
    
    private struct Storyboard {
        static let cellReuseIdentifier = "DetailCell"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = detailTableView.dequeueReusableCell(withIdentifier: Storyboard.cellReuseIdentifier, for: indexPath) as UITableViewCell
        
        // Configure cell...
        let item = detailItems.getDetailItem(selectedItem)![indexPath.row]
        cell.textLabel?.text = item
        
        if (detailItems.detailCellState[indexPath.row]) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (lastSelection != nil) {
            detailTableView.cellForRow(at: lastSelection)?.accessoryType = .none
            detailItems.detailCellState[lastSelection.row] = false
        }
        
        detailTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        detailItems.detailCellState[indexPath.row] = true
        lastSelection = indexPath
        detailTableView.deselectRow(at: indexPath, animated: true)
        selectedDetailItem = indexPath.row
    }

}
