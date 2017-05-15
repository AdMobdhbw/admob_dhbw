//
//  StickyBannerAD.swift
//  AdMob_dhbw
//
//  Created by Philipp Enke on 11.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit
import GoogleMobileAds

class StickyBannerAD: UITableViewController, GADBannerViewDelegate 
{
    
    // MARK: Init
    
    lazy var adStickyBannerView: GADBannerView = {
        let adStickyBannerView = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        adStickyBannerView.adUnitID = "ca-app-pub-2752059782429024/8442660995"
        adStickyBannerView.delegate = self
        adStickyBannerView.rootViewController = self
        
        return adStickyBannerView
    }()
    
    // MARK: View Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //adStickyBannerView.load(GADRequest())
    }
    
    // reload ad everytime the view appears
    override func viewDidAppear(_ animated: Bool) {
        adStickyBannerView.load(GADRequest())
    }
    
    // hide ad when view disappears
    override func viewDidDisappear(_ animated: Bool) {
        adStickyBannerView.isHidden = true
    }
    
    // MARK: AdMob actions
    
    // animated effect to show ad
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("Banner loaded successfully")
        adStickyBannerView.isHidden = false
        let translateTransform = CGAffineTransform(translationX: 0, y: -bannerView.bounds.size.height)
        bannerView.transform = translateTransform
        
        UIView.animate(withDuration: 0.5) {
            bannerView.transform = CGAffineTransform.identity
        }
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("Fail to receive ads")
        print(error)
    }
    
    // MARK: Table View actions
    
    // place ad in table header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return adStickyBannerView
    }
    
    // specify height of table header
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return adStickyBannerView.frame.height
    }
}
