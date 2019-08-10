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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        model.getArticles()
        
        
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath)
        return cell
    }
    
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //segue to detail view and pass selected article to that view
    }
    
}


extension ViewController: ArticleModelProtocol {
    func articlesRetrieved(_ articles: [Article]) {
        print("protocol set up successfully")
    }
}
