//
//  FirebaseItems.swift
//  AdMob_dhbw
//
//  Created by Marco Stierle on 12.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit

class FirebaseItems {
    
    // MARK: - Variables
    
    // items for the FirebaseTableController
    var sections = ["Start", "Develop", "Grow", "Earn"]
    
    var items: [[String]] = [["Get Started", "Analytics"], ["Cloud Messaging", "Cloud Functions", "Authentication", "Realtime Database", "Storage", "Hosting", "Crash Reporting"], ["Remote Config", "App Indexing", "Dynamic Links", "Invites", "AdWords"], ["AdMob"]]
    
    // Store the cell states of the FirebaseTableController
    var cellState: [[Bool]] = [[false, false], [false, false, false, false, false, false, false], [false, false, false, false, false], [false]]

}
