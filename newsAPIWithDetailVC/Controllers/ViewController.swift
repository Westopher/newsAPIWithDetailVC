//
//  ViewController.swift
//  newsAPIWithDetailVC
//
//  Created by West Kraemer on 8/7/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var model = ArticleModel()
    var articles = [Article]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        model.getArticles()
        
        
    }


}

extension ViewController: ArticleModelProtocol {
    func articlesRetrieved(_ articles: [Article]) {
        print("protocol set up successfully")
    }
}
