//
//  Article.swift
//  newsAPIWithDetailVC
//
//  Created by West Kraemer on 8/7/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import Foundation

struct ArticleService: Decodable {
    var totalResults: Int?
    var articles: [Article]?
}

struct Article: Decodable {
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    
}
