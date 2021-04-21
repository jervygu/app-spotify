//
//  WebViewController.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/21/21.
//

import UIKit
import WebKit
class WebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    var artistURL: URL? = nil
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let myURL = URL(string:"https://www.apple.com")
        guard let myURL = artistURL else {
            return
        }
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
    }}
