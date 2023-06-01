//
//  WebViewVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 31/05/23.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {

    // MARK: - Constants used in this file
    enum Constant {
        static let urlFB = "https://www.facebook.com/"
        static let emailJS = "document.getElementsByName('email')[0].value = 'RP';"
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet var superView: CustomActivityIndicatorView!
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        guard let url = URL(string: Constant.urlFB) else { return }
        webView.load(URLRequest(url: url))
        webView.uiDelegate = self
        webView.navigationDelegate = self
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullToRefreshAction), for: .allEvents)
        webView.scrollView.refreshControl = refreshControl
        
    }
    
    @objc func pullToRefreshAction() {
        webView.reload()
    }
    
}

// MARK: Extension for WebViewVC
extension WebViewVC: WKUIDelegate, WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        superView.stopAnimating()
        webView.evaluateJavaScript(Constant.emailJS)
        webView.scrollView.refreshControl?.endRefreshing()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print(#function)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        print(webView.url?.absoluteString)
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        print(webView.url?.absoluteString)
        decisionHandler(.allow)
    }
    
}


