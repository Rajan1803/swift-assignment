//
//  SavedVC.swift
//  News
//
//  Created by Rajan Patel on 14/07/23.
//

import UIKit

class SavedVC: UIViewController {

    // MARK: - Variables And Declarations
    @IBOutlet weak var lblNoSavedItems: UILabel!
    var listOfSavedArticles = [Article]()
    
    // MARK: - IBOutlets
    @IBOutlet weak var tblvNews: UITableView!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        listOfSavedArticles = Article.listOfAticles.filter({ article in
            article.isSelected == true
        })
        tblvNews.reloadData()
    }
    
    fileprivate func setUpViews() {
        tblvNews.delegate = self
        tblvNews.dataSource = self
        tblvNews.register(UINib(nibName: R.nib.newsCell.name, bundle: nil), forCellReuseIdentifier: R.nib.newsCell.name)
    }
    
}


 // MARK: - Extension for UITableViewDelegate, UITableViewDataSource
extension SavedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listOfSavedArticles.isEmpty {
            tblvNews.isHidden = true
        } else {
            tblvNews.isHidden = false
        }
        return listOfSavedArticles.count
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            let index = Article.listOfAticles.firstIndex(where: {article in
                article.title == listOfSavedArticles[indexPath.row].title
            })
            listOfSavedArticles.remove(at: indexPath.row)
            Article.listOfAticles[index!].isSelected = false
            tblvNews.deleteRows(at: [indexPath], with: .fade)
            tblvNews.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblvNews.dequeueReusableCell(withIdentifier: R.nib.newsCell, for: indexPath) else { return UITableViewCell() }
        cell.setData(article: listOfSavedArticles[indexPath.row])
        cell.hideThreeDots()
        return cell
    }
    
}
