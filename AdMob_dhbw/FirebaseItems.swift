//
//  FirebaseItems.swift
//  AdMob_dhbw
//
//  Created by Marco Stierle on 12.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit

class FirebaseItems {
    
    var sections = ["Start", "Develop", "Grow", "Earn"]
    
    var items: [[String]] = [["Get Started", "Analytics"], ["Cloud Messaging", "Cloud Functions", "Authentication", "Realtime Database", "Storage", "Hosting", "Test Lab", "Crash Reporting"], ["Remote Config", "App Indexing", "Dynamic Links", "Invites", "AdWords"], ["AdMob"]]
    
    var cellState: [[Bool]] = [[false, false], [false, false, false, false, false, false, false, false], [false, false, false, false, false], [false]]
    
    var detailCellState: [Bool]!
    
    var itemDictionary: [String : [String]]!
    
    var getStarted = [""]
    var analytics = [""]
    var cloudMessaging = [""]
    var cloudFunctions = [""]
    var authentication = [""]
    var realtimeDatabase = [""]
    var storage = [""]
    var hosting = [""]
    var testLab = [""]
    var crashReporting = [""]
    var remoteConfig = [""]
    var appIndexing = [""]
    var dynamicLinks = [""]
    var invites = [""]
    var adWords = [""]
    
    var adMob = [
        "Get Started",
        "App Transport Security",
        "Banner Ads",
        "Interstitial Ads",
        "Native Ads",
        "Native Ads Express",
        "Native Ads Advanced",
        "Targeting",
        "Ad Events",
        "Reporting",
        "Global Settings",
        "Mediation",
        "Mediation Networks",
        "Custom Events",
        "Native Custom Events",
        "Rewarded Video",
        "Rewarded Video Adapters"
    ]
    
    func getDetailItem(_ selectedRow: String) -> [String]? {
        switch (selectedRow) {
        case "AdMob":
            return adMob
        default:
            return nil
        }
    }
    
    var adMobURLs = [
        "https://firebase.google.com/docs/admob/ios/quick-start",
        "https://firebase.google.com/docs/admob/ios/app-transport-security",
        "https://firebase.google.com/docs/admob/ios/banner",
        "https://firebase.google.com/docs/admob/ios/interstitial",
        "https://firebase.google.com/docs/admob/ios/native",
        "https://firebase.google.com/docs/admob/ios/native-express",
        "https://firebase.google.com/docs/admob/ios/native-advanced",
        "https://firebase.google.com/docs/admob/ios/targeting",
        "https://firebase.google.com/docs/admob/ios/ad-events",
        "https://firebase.google.com/docs/admob/ios/reporting",
        "https://firebase.google.com/docs/admob/ios/global-settings",
        "https://firebase.google.com/docs/admob/ios/mediation",
        "https://firebase.google.com/docs/admob/ios/mediation-networks",
        "https://firebase.google.com/docs/admob/ios/custom-events",
        "https://firebase.google.com/docs/admob/ios/native-custom-events",
        "https://firebase.google.com/docs/admob/ios/rewarded-video",
        "https://firebase.google.com/docs/admob/ios/rewarded-video-adapters"
    ]
}
