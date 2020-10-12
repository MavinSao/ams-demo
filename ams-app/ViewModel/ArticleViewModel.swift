//
//  ArticleViewModel.swift
//  ams-app
//
//  Created by Mavin on 10/12/20.
//

import Foundation

struct ArticleViewModel {
    
    static let shared = ArticleViewModel()
    
    func fetchArticle(completion: @escaping ([ArticleModel],Error?)->()){
        Service.shared.fetchArticle { (articles, err) in
            var allArticles = [ArticleModel]()
            allArticles = articles!.compactMap(ArticleModel.init)
            completion(allArticles,nil)
        }
    }
    
    
}
