//
//  ApiManager.swift
//  News
//
//  Created by Rajan Patel on 14/07/23.
//
import Alamofire
import Foundation
import Reachability

class ApiManager {
    
    // MARK: - Variables And Declarations
    static let shared = ApiManager()
    var reachability: Reachability? = nil
    
    init(){
        reachability = try? Reachability()
    }
    
    func getNews(parameters: [String: Any], complisionHadler: @escaping (Result<NewsDetail, Error>) -> Void) {
        
        checkReachability()
        var urlstrr = RequestItemsType.getNews.url
        urlstrr.append(queryItems: [URLQueryItem(name: "apiKey", value: RequestItemsType.getNews.apiKey)])
        AF.request(urlstrr,parameters: parameters).response(completionHandler: {response in
            
            if let error = HTTPErrorCode(rawValue: response.response?.statusCode ?? 0) {
                complisionHadler(.failure(error))
                return
            }
            
            guard let httpResponse = response.response,
                  (200...299).contains(httpResponse.statusCode) else {
                complisionHadler(.failure(ApiError.requestFail))
                return
            }
            
            switch response.result {
            case .success(let data):
                guard let data else {
                    complisionHadler(.failure(ApiError.requestFail))
                    return
                }
                do {
                    let newsData =  try JSONDecoder().decode(NewsDetail.self, from: data)
                    complisionHadler(.success(newsData))
                } catch {
                    complisionHadler(.failure(ApiError.jsonParsingFail))
                }
                
            case .failure(let error):
                complisionHadler(.failure(error))
                return
            }
        })
    }
    
    func getSources(complisionHadler: @escaping (Result<SourcesDetail, Error>) -> Void) {
        checkReachability()
        var url = RequestItemsType.getSources.url
        url.append(queryItems: [URLQueryItem(name: "apiKey", value: RequestItemsType.getSources.apiKey)])
        
        AF.request(url).response(completionHandler: {response in
            
            if let error = HTTPErrorCode(rawValue: response.response?.statusCode ?? 0) {
                complisionHadler(.failure(error))
                return
            }
            guard let httpResponse = response.response,
                  (200...299).contains(httpResponse.statusCode) else {
                complisionHadler(.failure(ApiError.requestFail))
                return
            }
            
            switch response.result {
            case .success(let data):
                guard let data else {
                    complisionHadler(.failure(ApiError.requestFail))
                    return
                }
                
                do{
                    let sourcesData =  try JSONDecoder().decode(SourcesDetail.self, from: data)
                    complisionHadler(.success(sourcesData))
                }catch {
                    complisionHadler(.failure(ApiError.jsonParsingFail))
                }
                
            case .failure(let error):
                complisionHadler(.failure(error))
                return
            }
        })
    }
    
    func checkReachability() {
        reachability?.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("on wifi")
            }
            if reachability.connection == .cellular {
                print("on Celluler")
            }
        }
        
        reachability?.whenUnreachable = { _ in
            print("No Internet Connection")
            return
        }
        
        if reachability?.connection == .unavailable {
            print("No Internet Connection")
            return
        }
    }
}

