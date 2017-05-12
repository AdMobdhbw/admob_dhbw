//
//  FirebaseTableController.swift
//  AdMob_dhbw
//
//  Created by Marco Stierle on 12.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit

class FirebaseTableController: BannerAD {
    
    @IBOutlet weak var firebaseTableView: UITableView!
    
    var firebaseItems = FirebaseItems()
    //var firebaseItems = ["Get Started", "Analytics", "Cloud Messaging", "AdMob"]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return firebaseItems.allItems.count
    }
    
    private struct Storyboard {
        static let cellReuseIdentifier = "FirebaseCell"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = firebaseTableView.dequeueReusableCell(withIdentifier: Storyboard.cellReuseIdentifier, for: indexPath) as UITableViewCell
        
        let item = firebaseItems.allItems[indexPath.row]
        cell.textLabel?.text = item
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firebaseTableView.rowHeight = UITableViewAutomaticDimension
        firebaseTableView.estimatedRowHeight = 40
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        firebaseTableView.reloadData()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
