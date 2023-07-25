//
//  SourcesDetailsModel.swift
//  News
//
//  Created by Rajan Patel on 17/07/23.
//

import Foundation

// MARK: - SourcesDetail
struct SourcesDetail: Codable {
    let status: String?
    let sources: [SourceDetail]?
}

// MARK: - Source
struct SourceDetail: Codable {
    let id, name, description: String?
    let url: String?
    let category: String?
    let language, country: String?
}
