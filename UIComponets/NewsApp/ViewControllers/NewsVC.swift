
//  NewsVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 28/06/23.
//

import UIKit

class NewsVC: UIViewController, Storyboarded {

    // MARK: - Variables And Declarations
    let newsViewModel = NewsViewModel()
    var newsData: News?
    var parameters: [String: Any]?
    
    var articles = [Article]()
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var tblvNews: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()

    }
    
    // MARK: - Set up
    func setUpViews() {
        tblvNews.delegate = self
        tblvNews.dataSource = self
        
        tblvNews.register(UINib(nibName:Constants.Cell.newsTblvCell, bundle: nil), forCellReuseIdentifier: Constants.Nib.newsID)
        getNewsData()
        
    }

    // function to get data from server
    func getNewsData() {
        
        parameters = [
            "page" : 1,
            "pageSize" : 20
        ]
        
        
        newsViewModel.onSucces.bind({ [weak self] news in
            guard let self else {return }
            self.newsData = news
            guard let news else {return }
            guard let articles = news.articles else {return }
            self.articles.append(contentsOf: articles)
            DispatchQueue.main.async {
                self.tblvNews.reloadData()
            }
        })
        
        newsViewModel.onApiError.bind({  error in
            print("error",error)
            
        })
        newsViewModel.getNewsData(parameters: parameters)
    }

}

// MARK: Extension for UITableViewDelegate & UITableViewDataSource
extension NewsVC: UITableViewDelegate,UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblvNews.dequeueReusableCell(withIdentifier: Constants.Nib.newsID, for: indexPath) as? NewsTblvCell else { return TableViewCell()}
        cell.configCell(article: articles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: Constants.ViewController.newsDetailVC) as? NewsDetailVC else {return}
        vc.article = articles[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    

    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print(indexPath.row)
        print("",articles.count)
        guard let page = parameters?["page"] as? Int, let pageSize = parameters?["pageSize"] as? Int else { return }
      
        if(indexPath.row >= (page*pageSize) - 5) {
            parameters?["page"] =  parameters?["page"] as? Int ?? 0 + 1
            newsViewModel.getNewsData(parameters: parameters)
           
        }
    }
    
}
