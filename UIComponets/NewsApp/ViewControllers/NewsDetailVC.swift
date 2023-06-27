//
//  NewsDetailVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 03/07/23.
//

import UIKit

class NewsDetailVC: UIViewController {
    
    var article: Article?
    
    // MARK: - IBOutlets
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblPublishedAt: UILabel!
    @IBOutlet weak var imgvNews: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        
    }
    
    func setUpViews() {
        imgvNews.applyCornerRadius(radius: 20)
        guard let url = URL(string: article?.urlToImage ?? "") else {return }
        imgvNews.kf.setImage(with: url)
        lblTitle.text = article?.title
        lblAuthor.text = article?.author
        lblContent.text = article?.content
        lblDescription.text = article?.description
        lblPublishedAt.text = article?.publishedAt
        
    }

}
