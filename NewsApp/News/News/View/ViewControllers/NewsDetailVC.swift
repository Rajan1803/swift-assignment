//
//  NewsDetailVC.swift
//  News
//
//  Created by Rajan Patel on 14/07/23.
//

import UIKit
import Kingfisher

class NewsDetailVC: UIViewController {

    // MARK: - Variables And Declarations
    var currentPosition: Int?
    
    // MARK: - IBOutlets
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblAuther: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgSaved: UIButton!
    @IBOutlet weak var imgNews: UIImageView!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let currentPosition else {return }
        setUpViews(article: Article.listOfAticles[currentPosition])
        
    }

    // MARK: - IBActions
    @IBAction func btnBookmarkClicked(_ sender: UIButton) {
        guard let currentPosition else {return }
        Article.listOfAticles[currentPosition].isSelected = !Article.listOfAticles[currentPosition].isSelected
        
        if(Article.listOfAticles[currentPosition].isSelected) {
            imgSaved.setImage(R.image.saved(), for: .normal)
        }else {
            imgSaved.setImage(R.image.bookmark(), for: .normal)
        }

    }
    @IBAction func btnShareClicked(_ sender: UIButton) {
        let objectsToShare = [AppConstants.String.message,AppConstants.String.link] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    
     // MARK: - Set up
    func setUpViews(article: Article?) {
        guard let article else {return }
        lblTitle.text = article.title
        lblTime.text = article.publishedAt
        lblAuther.text = article.author
        lblDescription.text = article.description
        
        if let imgString = article.urlToImage {
            let url = URL(string: imgString)
            imgNews.kf.setImage(with: url,placeholder: R.image.noImage())
        } else {
            imgNews.image = R.image.noImage()
        }
        
        if(article.isSelected) {
            imgSaved.setImage(R.image.saved(), for: .normal)
        }else {
            imgSaved.setImage(R.image.bookmark(), for: .normal)
        }
    }
    
    @IBAction func btnClose(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
