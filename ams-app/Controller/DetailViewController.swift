//
//  DetailViewController.swift
//  ams-app
//
//  Created by Mavin on 10/12/20.
//

import UIKit

class DetailViewController: UIViewController {


    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var image: UIImage?
    var titleText: String?
    var descriptiontText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.imageView.image = image
        self.titleLabel.text = titleText
        self.descriptionLabel.text = descriptiontText
    }

}

extension DetailViewController: DetialDelegate{
    func didSent(article: ArticleModel) {
        self.image = article.image
        self.titleText = article.title
        self.descriptiontText = article.description
    }
    
    
}
