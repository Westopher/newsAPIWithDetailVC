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
       //clear imageview to prevent re-using images
        articleImageView.image = nil
        
        articleToDisplay = article
        
        headlineLabel.text = articleToDisplay!.title!
        
        let urlString = articleToDisplay!.urlToImage!
        
        guard urlString != nil else {
            print("couldn't get image url")
            return
        }
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            print("could not get url")
            return
        }
            
            let session = URLSession.shared
            
            let dataTask = session.dataTask(with: url!) { (data, response, error) in
                
                if error == nil && data != nil {
                    if self.articleToDisplay!.urlToImage == urlString {
                    DispatchQueue.main.async {
                        self.articleImageView.image = UIImage(data: data!)
                    }
                }
        }
        
    }
            dataTask.resume()
}
}
