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
        
        var stringUrl = "https://newsapi.org/v2/everything?q=bitcoin&from=2019-07-08&sortBy=publishedAt&apiKey=5ca10b2d20a545099a108a3aeceb329c"
        
        
        //make api request
        
        //parse json
        
        //pass results back to VC to be displayed w/delegate and protocol pattern
        delegate?.articlesRetrieved([Article]())
    }
    
}
