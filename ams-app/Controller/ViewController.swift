//
//  ViewController.swift
//  ams-app
//
//  Created by Mavin on 10/12/20.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var delegate: DetialDelegate?
    
    var allArticles: [ArticleModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        SkeletonAppearance.default.multilineCornerRadius = 10
        loadArticle()
        
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = tableview.rowHeight
        tableview.separatorStyle = .none
        
        tableview.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        tableview.isSkeletonable = true
//        tableview.showAnimatedSkeleton(usingColor: .gray,transition: .crossDissolve(0.25))
//    }
    
    func loadArticle(){
        ArticleViewModel.shared.fetchArticle { (articles, err) in
            self.allArticles = articles
            self.tableview.reloadData()
        }
    }

}


extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allArticles?.count ?? 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        if let allArticles = allArticles {
            cell.hideAnimation()
            cell.config(article: allArticles[indexPath.row])
        }

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = storyboard?.instantiateViewController(identifier: "DetailView") as! DetailViewController
        self.delegate = detailVC
        if let allArticles = allArticles {
            self.delegate?.didSent(article: allArticles[indexPath.row])
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
//    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
//        return "cell"
//    }
    
    
}

