//
//  ArticleModel.swift
//  ams-app
//
//  Created by Mavin on 10/12/20.
//

import Foundation
import UIKit

struct ArticleModel {
    var articleID: Int?
    var title, description, createdDate: String?
    var image: UIImage?
    
    init(article: Article) {
        self.articleID = article.articleID
        self.title = article.title
        self.description = article.articleDescription
        self.createdDate = article.createdDate
        
        if let urlBgImage = URL(string: article.imageURL){
            do{
              let data = try Data(contentsOf: urlBgImage)
              self.image = UIImage(data: data)!
            }catch let err{
                print("Error \(err)")
            }
        }
         

    }
}
