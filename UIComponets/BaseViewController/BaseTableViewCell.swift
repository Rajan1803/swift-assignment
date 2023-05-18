//
//  BaseTableViewCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 18/05/23.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    deinit {
            print("deinit \(self)")
        }

}
