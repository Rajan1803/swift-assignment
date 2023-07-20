//
//  SourcesCell.swift
//  News
//
//  Created by Rajan Patel on 14/07/23.
//

import UIKit
import Kingfisher

class SourcesCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgSource: UIImageView!
    
    // MARK: - Life cycle Method
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
     // MARK: - Set up
    func setData(source: SourceDetail?) {
        lblName.text = source?.name
        lblInfo.text = (source?.category ?? "") + "·" + (source?.country ?? "")
        imgSource.kf.setImage(with: RequestItemsType.getRandomImage.url)
    }
    
}
