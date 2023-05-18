//
//  TableViewCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 12/05/23.
//

import UIKit

class TableViewCell: BaseTableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var lblRole: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgLogo: UIImageView!
    
    // MARK: - Override Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
