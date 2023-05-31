//
//  JobSectionEnum.swift
//  UIComponets
//
//  Created by Rajan Patel on 18/05/23.
//

import Foundation

// MARK: - Enum for Section Selection
enum Sections: Int {
    
    case recommended, populer
    
    // MARK: - FUNCTIONS
    func getHeader() -> String {
    
        switch self {
        case .recommended: return Constants.JobHeader.recomendedHeaderTitle
        case .populer: return Constants.JobHeader.populerHeaderTitle
        }
        
    }
    
    func getNumberOfItems() -> Int {
        
        switch self {
        case .recommended: return JobModel.dictionaryOfJobs[Constants.dictionaryKeys.recomendedJobs]?.count ?? 0
        case .populer: return JobModel.dictionaryOfJobs[Constants.dictionaryKeys.populerJobs]?.count ?? 0
        }
        
    }
    
}
