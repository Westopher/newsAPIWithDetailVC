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
        articleToDisplay = article
        
        headlineLabel.text = articleToDisplay?.title!
        
    }

}
