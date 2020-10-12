//
//  Service.swift
//  ams-app
//
//  Created by Mavin on 10/12/20.
//

import Foundation

struct Service {
    
    static let shared = Service()
    
    func fetchArticle(completion: @escaping ([Article]?,Error?)->()){
        
        let urlString = "https://ams-resful.herokuapp.com/api/articles/"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            if let err = err {
                completion(nil,err)
            }
            
            //Check Res
            guard let data = data else{return}
            
            do{
            let articles:[Article] =  try JSONDecoder().decode([Article].self, from: data)
            
                DispatchQueue.main.sync {
                    completion(articles,nil)
                }
                
            } catch let err {
                print("Error: \(err)")
            }
            
        }.resume()
        
    }
    
}
