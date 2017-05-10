//
//  AndereView.swift
//  AdMob_dhbw
//
//  Created by Philipp Enke on 08.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit
import GoogleMobileAds

class InterstitialAD: UIViewController, GADInterstitialDelegate {
    
    var interstitial: GADInterstitial?
    var adExited = false
    
    private func createAndLoadInterstitial() -> GADInterstitial? {
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-2752059782429024/8899451793")
        
        guard let interstitial = interstitial else {
            return nil
        }
        
        let request = GADRequest()
        // next line is only needed if executed in the simulator
        request.testDevices = [ kGADSimulatorID ]
        interstitial.load(request)
        interstitial.delegate = self
        
        
        return interstitial
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if !adExited {
            interstitial = createAndLoadInterstitial()
            adExited = true
        } else {
            adExited = false
        }
    }
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("Interstitial loaded successfully")
        ad.present(fromRootViewController: self)
    }
    
    func interstitialDidFail(toPresentScreen ad: GADInterstitial) {
        print("Failed to receive interstitial")
    }
}
