//
//  ViewController.swift
//  MyWebview
//
//  Created by Sean on 2020/1/8.
//  Copyright © 2020 Sean. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    var webview: WKWebView!
    let webviewTitle = "Webview App"
    let webviewUrl   = "https://www.google.com.tw"
    
    @IBAction func backButton(_ sender: Any) {
        if webview.canGoBack {
            webview.goBack()
        
        } else {
            let alert = UIAlertController(title: "", message: "沒有上一頁了", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "好", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func reloadButton(_ sender: Any) {
        webview.reload()
    }
    
    override func loadView() {
        let config = WKWebViewConfiguration()
        webview = WKWebView(frame: .zero, configuration: config)
        webview.uiDelegate = self
        view = webview
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = webviewTitle
        
        if let myURL = URL(string: webviewUrl) {
            let myRequest = URLRequest(url: myURL)
            webview.load(myRequest)
        }
    }
}

