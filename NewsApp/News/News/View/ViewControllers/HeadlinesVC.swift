//
//  HeadlinesVC.swift
//  News
//
//  Created by Rajan Patel on 14/07/23.
//

import UIKit

class HeadlinesVC: UIViewController {

    private enum Constants {
        static let minimumInteritemSpacingForSectionAt: CGFloat = 0
        static let bottomSheetHeight: CGFloat = 150
        static let clcvAdditionalWidth: CGFloat = 50
        static let clcvHeight: CGFloat = 70
    }
    
    // MARK: - Variables And Declarations
    var coordinator: Coordinator?
    private var previouslySelected = IndexPath(row: 0, section: 0)
    private var currentlySelected = IndexPath(row: 0, section: 0)
    private var newsViewModel = NewsViewModel()
    private var listOfCategories = Category.categories
    
    // MARK: - IBOutlets
    @IBOutlet weak var tblvNews: UITableView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
     // MARK: - Set up
    private func bindViewModel() {
        newsViewModel.onSucces.bind({[weak self] newsResponse in
            guard let self else {return}
            self.newsViewModel.addArticles(articles: newsResponse?.articles)
            self.tblvNews.reloadData()
        })
        newsViewModel.onApiError.bind({ error in
            print("Error")
        })
    }
    
    private func initViews(){
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        tblvNews.delegate = self
        tblvNews.dataSource = self
        navigationController?.navigationBar.topItem?.title = AppConstants.String.navBarTitle
        let nib = UINib(nibName: R.nib.categoriesCell.name, bundle: nil)
        categoriesCollectionView.register(nib, forCellWithReuseIdentifier: R.nib.categoriesCell.name)
        tblvNews.register(UINib(nibName: R.nib.newsCell.name, bundle: nil),forCellReuseIdentifier: R.nib.newsCell.name)
        bindViewModel()
        newsViewModel.getNewsData(parameters: [AppConstants.String.category: Category.categories[0].name])
    }
    
}

 // MARK: - Extensions for UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension HeadlinesVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        listOfCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: R.nib.categoriesCell, for: indexPath) else {
            return UICollectionViewCell()
        }
        cell.setData(category: listOfCategories[indexPath.row])
        if(indexPath == currentlySelected)
        {
            cell.backgroundColor =  UIColor.black
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        newsViewModel.getNewsData(parameters: [AppConstants.String.category: Category.categories[indexPath.row].name])
        previouslySelected = currentlySelected
        currentlySelected = indexPath
        collectionView.cellForItem(at: previouslySelected)?.backgroundColor = UIColor.systemBackground
        collectionView.cellForItem(at: currentlySelected)?.backgroundColor = UIColor.black
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Constants.minimumInteritemSpacingForSectionAt
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Category.categories[indexPath.row].name.size(withAttributes: nil).width + Constants.clcvAdditionalWidth, height: Constants.clcvHeight)
    }
    
}

extension HeadlinesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Article.listOfAticles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblvNews.dequeueReusableCell(withIdentifier: R.nib.newsCell, for: indexPath) else { return UITableViewCell() }
        cell.setData(article: Article.listOfAticles[indexPath.row])
        cell.onMoreClicked.bind({ [weak self] currentCell in
            guard let self else {return }
            guard let currentCell else {return }
            self.tblvNews.indexPath(for: currentCell)
            guard let bottomSheetVC = R.storyboard.homeScreen.bottomSheetVC() else {return }
            bottomSheetVC.currentPosition = indexPath.row
            if let sheet = bottomSheetVC.sheetPresentationController{
                sheet.detents = [.custom { _ in
                    return Constants.bottomSheetHeight
                }]
            }
            self.navigationController?.present(bottomSheetVC, animated: true)
        })
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let newsDetailVC = (storyboard?.instantiateViewController(withIdentifier: R.nib.newsDetailVC.name)) as? NewsDetailVC else {return }
        
        newsDetailVC.currentPosition = indexPath.row
        
        if let sheet = newsDetailVC.sheetPresentationController {
            sheet.detents = [
                .custom { [weak self]_ in
                    guard let self else {return 0}
                    return self.view.frame.height - 200
                }, .large()
            ]
            sheet.prefersGrabberVisible = true
        }
        navigationController?.present(newsDetailVC, animated: true)
    }
    
}
