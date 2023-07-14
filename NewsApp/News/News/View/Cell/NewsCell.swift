//
//  NewsCell.swift
//  News
//
//  Created by Rajan Patel on 14/07/23.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {

    // MARK: - Variables And Declarations
    let onMoreClicked = Dynamic<NewsCell?>(nil)
    
    // MARK: - IBOutlets
    @IBOutlet weak var btnMore: UIButton!
    @IBOutlet weak var lblSources: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgNews: UIImageView!
    
    // MARK: - Life cycle Method
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }
    
     // MARK: - Set up
    fileprivate func setUpViews() {
        imgNews.layer.cornerRadius = 5
        imgNews.clipsToBounds = true
    }

     // MARK: - Set up
    func setData(article: Article?) {
        guard let article else { return }
        lblTitle.text = article.title
        lblSources.text = article.source?.name
        if let imgString = article.urlToImage {
            let url = URL(string: imgString)
        imgNews.kf.setImage(with: url,placeholder: R.image.noImage())
        } else {
            imgNews.image = R.image.noImage()
        }
    }
    
    func hideThreeDots() {
        btnMore.isHidden = true
    }
    
    // MARK: - IBAction
    @IBAction func btnMoreClicked(_ sender: UIButton) {
        onMoreClicked.value = self
    }
    
}
