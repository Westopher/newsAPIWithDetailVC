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
        //make api request
        
        //parse json
        
        //pass results back to VC to be displayed w/delegate and protocol pattern
        delegate?.articlesRetrieved([Article]())
    }
    
}
