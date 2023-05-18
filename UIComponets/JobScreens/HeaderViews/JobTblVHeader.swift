//
//  JobTblVHeader.swift
//  UIComponets
//
//  Created by Rajan Patel on 19/05/23.
//

import UIKit

class JobTblVHeader: UITableViewHeaderFooterView {

    // MARK: - IBOutlets
    @IBOutlet weak var lblTblSectionHeader: UILabel!
    @IBOutlet weak var btnSeeAll: UIButton!
    
    // MARK: - Life cycle Methods
    override class func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
