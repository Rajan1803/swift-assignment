//
//  JobHomeScreenCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 18/05/23.
//

import UIKit

class JobHomeScreenCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var btnJunior: UIButton!
    @IBOutlet weak var btnFullTime: UIButton!
    @IBOutlet weak var btnAdmin: UIButton!
    @IBOutlet weak var innerView: UIView!
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var imgBookmark: UIImageView!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgShellLogo: UIImageView!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblPackage: UILabel!
    
    // MARK: - Life cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews() 
    }
    
    // MARK: - Set up
    private func setUpViews() {
        outerView.applyCornerRadius(radius: 24)
        btnAdmin.applyCornerRadius(radius: 15)
        btnFullTime.applyCornerRadius(radius: 15)
        btnJunior.applyCornerRadius(radius: 15)
        imgShellLogo.applyCornerRadius(radius: 12)
    }
    
    func setData(indexPath: IndexPath) {
        lblTitle.text = FeaturedJob.jobData[indexPath.row].jobTitle
        lblCompanyName.text = FeaturedJob.jobData[indexPath.row].companyName
        imgShellLogo.image = FeaturedJob.jobData[indexPath.row].companyLogo
        lblPackage.text = FeaturedJob.jobData[indexPath.row].package
        lblLocation.text = FeaturedJob.jobData[indexPath.row].location
    }
    
   
}
