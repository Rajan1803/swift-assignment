//
//  JobTblViewHeader.swift
//  UIComponets
//
//  Created by Rajan Patel on 19/05/23.
//

import UIKit

class JobTblViewHeader: UIView {

    // MARK: - IBOutlets
    @IBOutlet weak var lblHeaderTitle: UILabel!
    @IBOutlet var headerView: JobTblViewHeader!
    @IBOutlet weak var btnSeeAll: UIButton!
    
    // MARK: - Life cycle Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        Bundle.main.loadNibNamed("", owner: self)
        addSubview(headerView)
    }
    
}
