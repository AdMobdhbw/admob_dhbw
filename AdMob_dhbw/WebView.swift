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
    
    // MARK: - Variables
    
    var webView: WKWebView!
    var urlString: String!
    var urlItems = URLItems()
    
    // MARK: - ViewController Lifecycle
    
    // called, if view = nil
    override func loadView() {
        // create a web view
        webView = WKWebView()
        
        webView.navigationDelegate = self
        
        // set it as view of this view controller
        view = webView
    }
    
    // load the URL and display it in the web view
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        urlString = urlItems.getURL(selectedItem, selectedDetailItem)!
        let url = URL(string: urlString)!
        webView.load(URLRequest(url: url))
        print("WebViewController loaded its view")
    }
}
