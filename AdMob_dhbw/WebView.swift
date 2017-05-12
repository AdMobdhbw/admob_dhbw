//
//  WebView.swift
//  AdMob_dhbw
//
//  Created by Marco Stierle on 12.05.17.
//  Copyright © 2017 Philipp Enke. All rights reserved.
//

import UIKit
import WebKit

class WebView: InterstitialAD, WKNavigationDelegate{
    
    var webView: WKWebView!
    
    override func loadView() { // called, if view = nil
        // create a web view
        webView = WKWebView()
        
        webView.navigationDelegate = self
        
        // set it as *the* view of this view controller
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.apple.de")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        print("WebViewController loaded its view")
    }
}
