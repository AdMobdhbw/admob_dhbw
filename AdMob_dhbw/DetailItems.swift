//
//  DetailItems.swift
//  AdMob_dhbw
//
//  Created by Marco Stierle on 14.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit

class DetailItems {
    
    var detailCellState: [Bool]!
    
    var getStarted = [
        "iOS"
    ]
    
    var analytics = [
        "Introduction",
        "Get Started",
        "Log Events",
        "Set User Properties",
        "Use in a WebView"
    ]
    
    var cloudMessaging = [
        "Introduction",
        "About FCM Messages",
        "Set up an iOS Client",
        "Provisioning APNs SSL Certificates",
        "Send your First Message",
        "Send Messages to Multiple Devices",
        "Receive Messages",
        "Send Messages to Topics",
        "Send to Device Groups",
        "Send Upstream Messages",
        "Send Messages with the Firebase Console"
    ]
    
    var cloudFunctions = [
        "Introduction",
        "What Can I Do with Cloud Functions?",
        "Get Started",
        "Writing Functions",
        "General Concepts",
        "Monitoring Functions",
        "API Reference",
        "Cloud Functions and Firebase",
        "Case Studies"
    ]
    
    var authentication = [
        "Introduction",
        "Users in Firebase Projects",
        "Get Started",
        "Manage Users",
        "Password Authetication",
        "Google Sign-In",
        "Facebook Login",
        "Twitter Login",
        "GitHub",
        "Use a Custom Auth System",
        "Anonymous Authentication",
        "Link Multiple Auth Providers",
        "Handle Errors"
    ]
    
    var realtimeDatabase = [
        "Introduction",
        "Get Started",
        "Structure Data",
        "Read and Write Data",
        "Work with Lists of Data",
        "Enable Offline Capabilities",
        "Automated Backups",
        "Profile Your Database"
    ]
    
    var storage = [
        "Introduction",
        "Get Started",
        "Create a Reference",
        "Upload Files",
        "Download Files",
        "Use File Metadata",
        "Delete Files",
        "Handle Errors"
    ]
    
    var hosting = [
        "Introduction",
        "Get Started",
        "Deploy Your Site",
        "Connect to Custom Domain",
        "Customize Hosting Behavior",
        "Reserved URLs"
    ]

    var crashReporting = [
        "Introduction",
        "Report Crashes"
    ]
    
    var remoteConfig = [
        "Introduction",
        "Parameters and Conditions",
        "API Overview",
        "Use Remote Config on iOS",
        "Sample App Walkthrough"
    ]
    
    var appIndexing = [
        "Introduction",
        "Get Started",
        "Test Your Implementation",
        "Enhance Search Performance"
    ]
    
    var dynamicLinks = [
        "Introduction",
        "Use Cases",
        "Create Dynamic Links",
        "Receive Dynamic Links",
        "View Analytics Data"
    ]
    
    var invites = [
        "Introduction",
        "iOS"
    ]
    
    var adWords = [
        "Introduction"
    ]
    
    var adMob = [
        "Introduction",
        "AdMob with Firebase",
        "Release Notes",
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
        switch selectedRow {
        case "Get Started":
            return getStarted
        case "Analytics":
            return analytics
        case "Cloud Messaging":
            return cloudMessaging
        case "Cloud Functions":
            return cloudFunctions
        case "Authentication":
            return authentication
        case "Realtime Database":
            return realtimeDatabase
        case "Storage":
            return storage
        case "Hosting":
            return hosting
        case "Crash Reporting":
            return crashReporting
        case "Remote Config":
            return remoteConfig
        case "App Indexing":
            return appIndexing
        case "Dynamic Links":
            return dynamicLinks
        case "Invites":
            return invites
        case "AdWords":
            return adWords
        case "AdMob":
            return adMob
        default:
            return []
        }
    }
}
