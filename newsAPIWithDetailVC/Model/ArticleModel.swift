//
//  ArticleModel.swift
//  newsAPIWithDetailVC
//
//  Created by West Kraemer on 8/8/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import Foundation

protocol ArticleModelProtocol {
    func articlesRetrieved(_ articles: [Article])
}

class ArticleModel {
    var delegate: ArticleModelProtocol?
    
    func getArticles() {
        
        var stringUrl = "https://newsapi.org/v2/top-headlines?country=us&apiKey=5ca10b2d20a545099a108a3aeceb329c"
        
        let url = URL(string: stringUrl)
        
        guard url != nil else {
            print("Could not get url")
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
           
            if error == nil && data != nil {
                
                do {
                    let decoder = JSONDecoder()
                    let result = try
                        decoder.decode(ArticleService.self, from: data!)
                    
                    let articles2 = result.articles!
                    print(articles2)
                    DispatchQueue.main.async {
                        self.delegate?.articlesRetrieved(articles2)
                    }
                }
                catch {
                    print("Could not decode the JSON")
                    return
                }
            }
            
        }
        
        dataTask.resume()
        
        
    }
    
}
