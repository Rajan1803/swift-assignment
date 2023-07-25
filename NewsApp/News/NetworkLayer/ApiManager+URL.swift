//
//  ApiManager+Links.swift
//  News
//
//  Created by Rajan Patel on 17/07/23.
//

import Foundation


struct URLS {
    
    static let baseScheme = "https://"
    static let newsBaseURL = "newsapi.org"
    static let randomImageUrl = "random.imagecdn.app"
    
}

protocol EndPointType {
    
    var baseURL: String { get }
    var version: String { get }
    var path: String { get }
    var httpMethod: MethodType { get }
    var url: URL { get }
    
}

protocol URLParams {
    
    func getParams() -> [URLQueryItem]
    
}

enum RequestItemsType {
    
    case getNews
    case getSources
    case getRandomImage
    
}


enum ApiError: Error {
    
    case requestFail
    case invalidUrl
    case noInternetConnection
    case jsonParsingFail
    
}

enum MethodType: String {
    
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    
}

extension RequestItemsType: EndPointType {
    
    var baseURL: String {
        switch self {
        case .getNews, .getSources:
            return URLS.newsBaseURL
        case .getRandomImage:
            return URLS.randomImageUrl
        }
    }
    
    var version: String {
        switch self {
        case .getNews, .getSources:
            return "/v2"
        case .getRandomImage:
            return ""
        }
    }
    
    var apiKey: String {
        switch self {
        case .getNews, .getSources:
            return "9eb35182776b4bc6a67da45fa36ba3d7"
        case .getRandomImage:
            return ""
        }
    }
    
    var path: String {
        switch self {
        case .getNews, .getSources:
            return "/top-headlines"
        case.getRandomImage:
            return ""
        }
    }
    
    var httpMethod: MethodType {
        switch self {
        case .getNews, .getSources:
            return .get
        case .getRandomImage:
            return .get
        }
    }
    
    var url: URL {
        switch self {
        case .getNews:
            return URL(string: URLS.baseScheme + self.baseURL + self.version + self.path + "?country=in")!
        case .getSources:
            return URL(string: URLS.baseScheme + self.baseURL + self.version + self.path + "/sources?")!
        case .getRandomImage:
            return URL(string: URLS.baseScheme + self.baseURL + self.version + self.path + "/500/150")!
        }
    }
    
}
