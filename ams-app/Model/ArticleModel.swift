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
//    var profileIamage: UIImage?
    
    init(article: Article) {
        self.articleID = article.articleID
        self.title = article.title
        self.description = article.articleDescription
        self.createdDate = article.createdDate
        
        
        if let urlBgImage = URL(string: article.imageURL){
            do{
              let dataImg = try Data(contentsOf: urlBgImage)
//              let dataProfile = try Data(contentsOf: urlProfile)
              self.image = UIImage(data: dataImg)!
//              self.profileIamage = UIImage(data: dataProfile)
            }catch let err{
                print("Error \(err)")
            }
        }
        
         

    }
}
