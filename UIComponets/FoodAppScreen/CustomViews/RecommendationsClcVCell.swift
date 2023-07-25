//
//  RecommendationsClcVCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 05/06/23.
//

import UIKit

class RecommendationsClcVCell: UICollectionViewCell {

    private enum Constant {
        static let containerRadius = 24
        static let imgDiscountWidth: CGFloat = 63
        static let imgDiscountHeight: CGFloat = 28
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet private weak var lblReview: UILabel!
    @IBOutlet private weak var lblRate: UILabel!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblDistance: UILabel!
    @IBOutlet private weak var lblTime: UILabel!
    
    // MARK: - Variables And Declarations
    var imgDiscountView: UIImageView?
    
    // MARK: - Life cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        containerView.applyCornerRadius(radius: 24)
        containerView.applyBorderColor(borderColor: UIColor.lightGray.cgColor , borderWidth: 0.1)
        imgDiscountView = UIImageView(frame: CGRect(x: containerView.frame.minX - 5, y: containerView.frame.minY + 10, width: Constant.imgDiscountWidth, height: Constant.imgDiscountHeight))
        imgDiscountView?.image = UIImage(named: Constants.Img.imgDiscount)
        containerView.addSubview(imgDiscountView ?? UIView())
        
    }
    
    func setData(data: FoodModel) {
        imgFood.image = data.image
        imgDiscountView?.image = data.imgDiscount
        lblTime.text = data.time
        lblTitle.text = data.tilte
        lblDistance.text = data.distance
        lblRate.text = data.rating
        lblReview.text = data.ratingText
    }

}
