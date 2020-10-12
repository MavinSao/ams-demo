//
//  ViewController.swift
//  ams-app
//
//  Created by Mavin on 10/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    var delegate: DetialDelegate?
    
    var allArticles: [ArticleModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        
        loadArticle()
        
        tableview.rowHeight = UITableView.automaticDimension
        tableview.estimatedRowHeight = tableview.rowHeight
        tableview.separatorStyle = .none
        
        tableview.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
    }
    
    func loadArticle(){
        ArticleViewModel.shared.fetchArticle { (articles, err) in
            self.allArticles = articles
            self.tableview.reloadData()
        }
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allArticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.config(article: allArticles[indexPath.row])

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = storyboard?.instantiateViewController(identifier: "DetailView") as! DetailViewController
        self.delegate = detailVC
        self.delegate?.didSent(article: allArticles[indexPath.row])
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
}

