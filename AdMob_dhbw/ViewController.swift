//
//  ViewController.swift
//  AdMob_dhbw
//
//  Created by Philipp Enke on 28.03.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADInterstitialDelegate {

    var interstitial: GADInterstitial?
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interstitial = createAndLoadInterstitial()
    }
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        print("Interstitial loaded successfully")
        ad.present(fromRootViewController: self)
    }
    
    func interstitialDidFail(toPresentScreen ad: GADInterstitial) {
        print("Failed to receive interstitial")
    }
}

