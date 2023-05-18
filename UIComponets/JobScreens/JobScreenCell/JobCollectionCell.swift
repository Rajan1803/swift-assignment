 //
//  JobCollectionCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 17/05/23.
//

import UIKit

class JobCollectionCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionInnerView: UIView!
    @IBOutlet weak var lblJobTitle: UILabel!
    @IBOutlet weak var lblSalary: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var imgCompanyLogo: UIImageView!
   
    //set data
    func setData(data: JobModel.JobAttributes) {
        self.imgCompanyLogo.image = data.imgCompanyLogo
        self.lblJobTitle.text = data.jobTitle
        self.lblSalary.text = data.salary
        self.lblCompanyName.text = data.companyName
        self.applyCornerRadius(radius: 10)
    }
    
}
