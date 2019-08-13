//
//  ArticleCell.swift
//  newsAPIWithDetailVC
//
//  Created by West Kraemer on 8/10/19.
//  Copyright © 2019 West Kraemer. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    var articleToDisplay: Article?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayArticle(article: Article) {
       headlineLabel.alpha = 0
        articleImageView.alpha = 0
        
        //clear imageview to prevent re-using images
        articleImageView.image = nil
        
        articleToDisplay = article
        
        headlineLabel.text = articleToDisplay!.title!
        
        UIView.animate(withDuration: 1.6, delay: 0, options: .curveEaseOut, animations: {
            self.headlineLabel.alpha = 1
        }, completion: nil)
        
        
        let urlString = articleToDisplay?.urlToImage
        
        guard urlString != nil else {
            print("couldn't get image url")
            return
        }
        
        let cachedData = CacheManager.retrieveImageData(url: urlString ?? "no urlstring")
        
        if cachedData != nil {
            articleImageView.image = UIImage(data: cachedData!)
            UIView.animate(withDuration: 1.6, delay: 0, options: .curveEaseOut, animations: {
                self.articleImageView.alpha = 1
            }, completion: nil)
            return
        }
        
        let url = URL(string: urlString!)
        
        guard url != nil else {
            print("could not get url")
            return
        }
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: url!) { (data, response, error) in
                
                if error == nil && data != nil {
                    CacheManager.saveImageData(url: (urlString)!, data: data!)
                    if self.articleToDisplay!.urlToImage == urlString {
                    DispatchQueue.main.async {
                        self.articleImageView.image = UIImage(data: data!)
                        
                        UIView.animate(withDuration: 1.6, delay: 0, options: .curveEaseOut, animations: {
                            self.articleImageView.alpha = 1
                        }, completion: nil)
                    }
                }
        }
        
    }
            dataTask.resume()
}
}
