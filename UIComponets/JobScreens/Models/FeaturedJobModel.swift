//
//  FeaturedJobModel.swift
//  UIComponets
//
//  Created by Rajan Patel on 20/05/23.
//
import UIKit

struct FeaturedJob {
    
    // MARK: - Properties
    let jobTitle: String
    let companyName: String
    let companyLogo: UIImage?
    let package: String
    let location: String
   
    static var jobData = [FeaturedJob(jobTitle: "Junior Executive", companyName: "Shell plc", companyLogo: UIImage(named: "shellLogo"), package: "$98,00/year", location: "Texas, USA"),FeaturedJob(jobTitle: "Junior Executive", companyName: "Shell plc", companyLogo: UIImage(named: "shellLogo"), package: "$98,00/year", location: "Texas, USA"),]
    
}
