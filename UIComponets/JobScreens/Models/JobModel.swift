//
//  JobModel.swift
//  UIComponets
//
//  Created by Rajan Patel on 17/05/23.
//

import UIKit

struct JobModel {
    
    struct JobAttributes {
        
        // MARK: - Properties
        let jobTitle: String
        let companyName: String
        let salary: String
        let imgCompanyLogo: UIImage
        
    }
    
    static var dictionaryOfJobs = [
           "Recomended Jobs": [
            JobAttributes(jobTitle: "UX Designer", companyName: "Dribbble", salary: "$80,000/y", imgCompanyLogo: UIImage(named: "dribbble")!),
            JobAttributes(jobTitle: "UX Designer L3", companyName: "Facebook", salary: "$96,000/y", imgCompanyLogo: UIImage(named: "FaceBookLogo")!),
            JobAttributes(jobTitle: "UX Designer L2", companyName: "Spotify", salary: "$115,000/y",imgCompanyLogo: UIImage(named: "spotify")!),
            JobAttributes(jobTitle: "UX Designer", companyName: "Pinterest", salary: "$96,000/y", imgCompanyLogo: UIImage(named: "pinterest")!),
               ],
           "Popular": [
            JobAttributes(jobTitle: "UX Designer", companyName: "Ubuntu", salary: "$80,000/y", imgCompanyLogo: UIImage(named: "ubuntu")!),
            JobAttributes(jobTitle: "UX Designer L5", companyName: "Firefox", salary: "$96,000/y", imgCompanyLogo: UIImage(named: "firefox")!),JobAttributes(jobTitle: "UX Designer", companyName: "Ubuntu", salary: "$80,000/y", imgCompanyLogo: UIImage(named: "ubuntu")!),
            JobAttributes(jobTitle: "UX Designer L5", companyName: "Firefox", salary: "$96,000/y", imgCompanyLogo: UIImage(named: "firefox")!)
               ]
       ]
  
}
