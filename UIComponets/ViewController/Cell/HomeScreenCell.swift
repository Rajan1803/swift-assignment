//
//  HomeScreenCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 15/05/23.
//

import UIKit

// MARK: - protocol for statusButtonClick Event handling
protocol StatusBtnDelegate: AnyObject {
    
    func statusBtnClick(cell: HomeScreenCell)
    
}

class HomeScreenCell: BaseTableViewCell {

    // MARK: - Variables And Declaration
    weak var delegate: StatusBtnDelegate? = nil
    
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var btnStatus: UIButton!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDocumentID: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        btnStatus.cornerRadius = 10
        btnStatus.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        containerView.cornerRadius = 10
        containerView.clipsToBounds = true
        containerView.backgroundColor = .white
    }

    // MARK: - IBActions
    @IBAction func statusButtonClick(_ sender: UIButton) {
        delegate?.statusBtnClick(cell: self)
    }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(data: Document) {
        lblType.text = data.type
        lblDate.text = data.date
        lblTitle.text = data.title
        lblEmail.text = data.emailID
        lblDocumentID.text = data.id
        btnStatus.setTitle(data.status.getStatus(), for: .normal)
        btnStatus.backgroundColor = data.status.getColor()
    }

}



