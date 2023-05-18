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
        // Initialization code
        setUpViews() 
    }
    
    // MARK: - Set up
    func setUpViews() {
        outerView.applyCornerRadius(radius: 24)
        btnAdmin.applyCornerRadius(radius: 15)
        btnFullTime.applyCornerRadius(radius: 15)
        btnJunior.applyCornerRadius(radius: 15)
        imgShellLogo.applyCornerRadius(radius: 12)
    }
    
    func setData(indexPath: IndexPath){
        self.lblTitle.text = FeaturedJob.jobData[indexPath.row].jobTitle
        self.lblCompanyName.text = FeaturedJob.jobData[indexPath.row].companyName
        self.imgShellLogo.image = FeaturedJob.jobData[indexPath.row].companyLogo
        self.lblPackage.text = FeaturedJob.jobData[indexPath.row].package
        self.lblLocation.text = FeaturedJob.jobData[indexPath.row].location
    }
    
   
}
