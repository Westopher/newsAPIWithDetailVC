//
//  CacheManager.swift
//  newsAPIWithDetailVC
//
//  Created by West Kraemer on 8/11/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var imageDictionary = [String:Data]()
    
    static func saveImageData(url: String, data: Data) {
        imageDictionary[url] = data
        
    }
    
    static func retrieveImageData(url: String) -> Data? {
        return imageDictionary[url]
    }
    
}
