//
//  NewsDetailModel.swift
//  News
//
//  Created by Rajan Patel on 15/07/23.
//

import Foundation

struct NewsDetail: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {

    let source: Source?
    let author: String?
    let title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt, content: String?
    var isSelected = false
    
    static var listOfAticles = [Article]()
    enum CodingKeys: String, CodingKey {
            case source = "source"
            case author = "author"
            case title = "title"
            case description = "description"
            case url = "url"
            case urlToImage = "urlToImage"
            case publishedAt = "publishedAt"
            case content = "content"
        }
}

// MARK: - Author
struct Author: Codable {
    let bbcNews: String?
    let bbcSport: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
