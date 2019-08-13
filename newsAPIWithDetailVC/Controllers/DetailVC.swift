//
//  DetailVC.swift
//  newsAPIWithDetailVC
//
//  Created by West Kraemer on 8/9/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit
import WebKit

class DetailVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var articleURL: String?
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewWillAppear(_ animated: Bool) {
        if articleURL != nil {
            let url = URL(string: articleURL!)
            guard url != nil else {
                return
            }
        let request = URLRequest(url: url!)
        webView.load(request)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.alpha = 1
        spinner.startAnimating()
        
        webView.navigationDelegate = self
    }

}

extension DetailVC: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinner.stopAnimating()
        spinner.alpha = 0
    }
}
