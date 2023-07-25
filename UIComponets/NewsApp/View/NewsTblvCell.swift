//
//  NewsTblvCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 28/06/23.
//

import UIKit
import Kingfisher

class NewsTblvCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    // MARK: - Life cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpViews()
    }
    
    private func setUpViews() {
        imgView.applyCornerRadius(radius: 20)
        imgView.contentMode = .scaleAspectFill
        
    }
    
    // Set Data
    func configCell(article: Article?) {
        lblTitle.text = article?.title ?? "No value"
        lblAuthor.text = article?.author ?? "No value"
        
        guard let url = URL(string: article?.urlToImage ?? "") else {return }
        imgView.kf.setImage(with: url)
    }

}
