//
//  TableViewController.swift
//  AdMob_dhbw
//
//  Created by Philipp Enke on 08.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit
// import Framework
import GoogleMobileAds

class BannerAD: UITableViewController, GADBannerViewDelegate 
{
    // MARK: Init
    
    // lazy var to initialize variable only if used
    lazy var adBannerView: GADBannerView = {
        //specify ad style
        let adBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        // assign ad unit ID from AdMob website for ad style
        adBannerView.adUnitID = "ca-app-pub-2752059782429024/8442660995"
        adBannerView.delegate = self
        adBannerView.rootViewController = self
        
        return adBannerView
    }()
    
    // MARK: View Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // request the ad
        adBannerView.load(GADRequest())
    }
    
    // MARK: AdMob actions
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("Banner loaded successfully")
        // banner assigned to table header
        tableView.tableHeaderView?.frame = bannerView.frame
        tableView.tableHeaderView = bannerView
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("Fail to receive ads")
        print(error)
    }
}

