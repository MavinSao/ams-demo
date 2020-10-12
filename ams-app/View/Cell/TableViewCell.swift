//
//  TableViewCell.swift
//  ams-app
//
//  Created by Mavin on 10/12/20.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func config(article: ArticleModel) {
        self.bgImage.image = article.image
        self.titleLabel.text = article.title
        self.descriptionLabel.text = article.description
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
