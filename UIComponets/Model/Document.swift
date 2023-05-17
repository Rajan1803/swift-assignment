//
//  Document.swift
//  UIComponets
//
//  Created by Rajan Patel on 15/05/23.
//

import UIKit

class Document {
    
    // MARK: - Variables And Declarations
    let id: String
    let title: String
    let emailID: String
    let type: String
    let date: String
    var status: Status = Status.awaitingApproval
    
    init(id: String, title: String, emailID: String, type: String, date: String) {
        self.id = id
        self.title = title
        self.emailID = emailID
        self.type = type
        self.date = date
    }
    
    static var data = [Document(id: "745AF6,", title: "Test Request Compliance Approval", emailID: "DavisBaptista@domain.name", type: "Request",date: "Jan 01, 2020"),Document(id: "745AF6,", title: "Test Request Compliance Approval", emailID: "DavisBaptista@domain.name", type: "Request",date: "Jan 01, 2020"),Document(id: "745AF6,", title: "Test Request Compliance Approval", emailID: "DavisBaptista@domain.name", type: "Request",date: "Jan 01, 2020"),Document(id: "745AF6,", title: "Test Request Compliance Approval", emailID: "DavisBaptista@domain.name", type: "Request",date: "Jan 01, 2020"),Document(id: "745AF6,", title: "Test Request Compliance Approval", emailID: "DavisBaptista@domain.name", type: "Request",date: "Jan 01, 2020"),Document(id: "745AF6,", title: "Test Request Compliance Approval", emailID: "DavisBaptista@domain.name", type: "Request",date: "Jan 01, 2020")]
    
}

