//
//  BannerAnimationAD.swift
//  AdMob_dhbw
//
//  Created by Philipp Enke on 11.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit
import GoogleMobileAds

class BannerAnimationAD: UIViewController, GADBannerViewDelegate
{
    
    // MARK: Init
    
    var adAnimationBannerView: GADBannerView?
    
    // MARK: View Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adAnimationBannerView = GADBannerView(adSize: kGADAdSizeSkyscraper)
        // relocate ad 
        adAnimationBannerView?.center = CGPoint(x: self.view.center.x*1.5, y: self.view.center.y)
        adAnimationBannerView?.adUnitID = "ca-app-pub-2752059782429024/8442660995"
        adAnimationBannerView?.delegate = self
        adAnimationBannerView?.rootViewController = self
        
        adAnimationBannerView?.load(GADRequest())
    }
    
    // AdMob actions
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("Banner loaded successfully")
        
        // before showing up, move it out of the view
        let translateTransform = CGAffineTransform(translationX: -2 * bannerView.bounds.size.width, y: 0)
        bannerView.transform = translateTransform
        // animate moving into view
        UIView.animate(withDuration: 0.5){
            // create subview for ad
            var adView = UIView(frame: bannerView.frame)
            bannerView.transform = CGAffineTransform.identity
            adView = bannerView 
            // assign subview
            self.view.addSubview(adView)
        }
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        print("Fail to receive ads")
        print(error)
    }
}
