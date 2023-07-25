//
//  JobHomeScreenEnum.swift
//  UIComponets
//
//  Created by Rajan Patel on 20/05/23.
//

import UIKit

enum JobTypes: Int {
    
    case featuredJob, populerJobs
    
    func getHeaderTitle() -> String {
        switch self {
        case .featuredJob: return "Featured Jobs"
        case .populerJobs: return "Populer Jobs"
        }
    }
    
    func getHeightForRow() -> CGFloat {
        switch self {
        case .featuredJob: return UITableView.automaticDimension
        case .populerJobs: return 230
        }
    }
    
}
