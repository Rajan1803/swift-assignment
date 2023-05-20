//
//  ExpandableCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 16/05/23.
//

import UIKit


// MARK: - protocol for buttonClick Event handling
protocol ExpandButtonDelegate: AnyObject {
    
    func expandButtonClick(cell: ExpandableCell)
    
}

class ExpandableCell: BaseTableViewCell {

    // MARK: - Variables And Declarations
    var delegate: ExpandButtonDelegate?
    
    // MARK: - IBOutlets
    @IBOutlet weak var btnExpand: UIButton!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblName: UILabel!
    
    // MARK: - Override Functions
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - IBAction
    @IBAction func expandBtnClick(_ sender: UIButton) {
        delegate?.expandButtonClick(cell: self)
    }
    
    // MARK: - Set up
    func setData(data: Animals) {
        self.lblName.text = data.name
        self.lblDescription.text = data.description
        lblDescription.numberOfLines = data.isExpanded ? 0 : 4
        btnExpand.setTitle(data.isExpanded ? Constants.String.seeLess: Constants.String.seeMore, for: .normal)
    }
    
}
