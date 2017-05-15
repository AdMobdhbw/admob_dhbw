//
//  InterstitialAD.swift
//  AdMob_dhbw
//
//  Created by Marco Stierle on 08.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit
import GoogleMobileAds

class InterstitialAD: UIViewController, GADInterstitialDelegate {
    
    // variable to store and display the Ad
    var interstitial: GADInterstitial?
    // variable to store the state of the Ad
    var adExited = false
    
    func createAndLoadInterstitial() -> GADInterstitial? {
        // assign adUnitID to interstitial variable
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-2752059782429024/8899451793")
        
        // make sure assigning the adUnitID was successful
        guard let interstitial = interstitial else {
            return nil
        }
        
        // initialize an ad request
        let request = GADRequest()
        // next line is only needed if executed in the simulator
        request.testDevices = [ kGADSimulatorID ]
        // load interstitial with request and set delegate
        interstitial.load(request)
        interstitial.delegate = self
        
        return interstitial
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        // create & load interstitial when ad did't just exit
        if !adExited {
            interstitial = createAndLoadInterstitial()
        } else {
            adExited = false
        }
    }
    
    // present ad if interstitial received the ad
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("Interstitial loaded successfully")
        ad.present(fromRootViewController: self)
    }
    
    func interstitialDidFail(toPresentScreen ad: GADInterstitial) {
        print("Failed to receive interstitial")
    }
    
    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
        adExited = true
    }
}
