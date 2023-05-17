//
//  StatusEnum.swift
//  UIComponets
//
//  Created by Rajan Patel on 16/05/23.
//

import UIKit

// MARK: - Enum to maintain button status
enum Status: String, CaseIterable {
    case approved, awaitingApproval
    
    // MARK: - FUNCTIONS
    func getStatus() -> String {
        switch self {
            case .approved : return "Approved"
            case .awaitingApproval : return "Awaiting Approval"
        }
    }
    
    func getColor() -> UIColor {
        switch self {
        case .approved: return .green
        case .awaitingApproval: return UIColor(named: Color.statusBtnBackground) ?? .orange
        }
        
    }
    
    mutating func switchStatus() {
        switch self {
        case .approved: self = .awaitingApproval
        case .awaitingApproval: self = .approved
        }
    }
    
}
