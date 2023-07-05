//
//  ApiManager.swift
//  UIComponets
//
//  Created by Rajan Patel on 28/06/23.
//

import Foundation
import Reachability
import Alamofire


class APIManager: NSObject {
    private override init(){}
    static let shared = APIManager()
    let reachability = try? Reachability()
    
    
//    var progress: ((Float) -> Void)?
    var responseImage: ((UIImage) -> Void)?
    var progress: ((Float) -> Void)?
    

    func apiCall<T: Codable>(url: URL,methodType: MethodType = MethodType.get,parameter: Codable?, complisionHadler: @escaping (Result<T, Error>) -> Void){
        

        do {
            if try Reachability().connection == .unavailable {
                complisionHadler(.failure(ApiError.noInternetConnection))
                return
            }
        } catch {
            complisionHadler(.failure(error))
        }
        
        var urlRequest = URLRequest(url: url)
        
        switch methodType {
        case .get:
            break
        case .post:
            if let parameter = parameter {
                do {
                    urlRequest.httpBody = try JSONEncoder().encode(parameter)
                    } catch let error {
                        print("Errors \(error)")
                    }
                    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
                        }
        default: break
        }
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data,response,error in
            if let error {
                complisionHadler(.failure(error))
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                complisionHadler(.failure(ApiError.requestFail))
              return
            }
            
            guard let data = data else {
                complisionHadler(.failure(ApiError.requestFail))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                complisionHadler(.success(decodedData))
            }catch {
                complisionHadler(.failure(error))
            }
            
        }).resume()
        
    }
    
    
    func getDataAF<T: Codable>(url: URL,methodType: MethodType = MethodType.get,parameters: [String: Any]? = nil, complisionHadler: @escaping (Result<T, Error>) -> Void){

        do {
            if try Reachability().connection == .unavailable {
                complisionHadler(.failure(ApiError.noInternetConnection))
                return
            }
        } catch {
            complisionHadler(.failure(error))
        }
        
        AF.request(url, parameters: parameters).response { response in
            response.response?.statusCode
            
            
            guard let statusCode = response.response?.statusCode else {
                complisionHadler(.failure(ApiError.requestFail))
                return
                
            }
            
            if !(200...299).contains(statusCode){
                complisionHadler(.failure(ApiError.requestFail))
            }

            switch response.result {
            case .success(let data):
                do {
                    guard let data else {
                        complisionHadler(.failure(ApiError.requestFail))
                        return
                        
                    }
                    let newsData =  try JSONDecoder().decode(T.self, from: data)
                    complisionHadler(.success(newsData ))
                }catch {
                    complisionHadler(.failure(error))
                }
                
            case .failure(let error):
                complisionHadler(.failure(error))
                
            }
        }

    }
}


struct URLS {
    
    static let baseScheme = "https://"
    static let newsBaseURL = "newsapi.org"
    static let newsVersion = "/v2"
    static let apiKey = "52d58b2d2e2649ffa6fe5d019b6b0d16"
    static let path = "/everything"
    static let api = "/api"
    
    
}

enum ApiKeys {
    case getNews
    case upload
    
    func getKey() -> String {
        switch self {
        case .getNews: return "52d58b2d2e2649ffa6fe5d019b6b0d16"
        case .upload: return "2000b43f5584c437ff44df736ba33d8c"
        }
    }
   
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
    case uploadImage
    case downloadImage
    case dogImage
    
}
//https://img.freepik.com/premium-photo/golden-retriever-lying-panting-isolated-white_191971-16974.jpg

enum ApiError: Error {
    case requestFail
    case invalidUrl
    case noInternetConnection
}

enum MethodType: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
    
}



extension RequestItemsType: EndPointType {
    
    //Bundle.main.object(forInfoDictionaryKey: "BaseURL")
    var baseURL: String {
        switch self {
        case .getNews:
            return URLS.newsBaseURL
        case .uploadImage:
            return "api.imgbb.com"
        case .downloadImage:
            return "sample-videos.com"
        case .dogImage:
            return "img.freepik.com"
        }
    }
    
    var version: String {
        switch self {
        case .getNews:
            return URLS.newsVersion
        case .uploadImage:
            return "/1"
        case .downloadImage:
            return ""
        case .dogImage:
            return ""
        }
    }
    
    var api: String {
        switch self {
        case .getNews:
            return URLS.api
        case .uploadImage:
           return ""
        case .downloadImage:
            return "/img"
        case .dogImage:
           return "/premium-photo"
        }
    }
    
    var path: String {
        switch self {
        case .getNews:
            return URLS.path
        case .uploadImage:
            return "/upload"
        case .downloadImage:
            return "/Sample-jpg-image-30mb.jpg"
        case .dogImage:
            return "/golden-retriever-lying-panting-isolated-white_191971-16974.jpg"
        }
    }
    
    var httpMethod: MethodType {
        switch self {
        case .getNews:
            return .get
        case .uploadImage:
            return .post
        case .downloadImage:
            return .get
        case .dogImage:
            return .get
        }
    }
        
    var url: URL {
        switch self {
        case .getNews:
            return URL(string: URLS.baseScheme + self.baseURL + self.version + self.path + "?q=apple&from=2023-06-26&to=2023-06-26&sortBy=popularity&apiKey=5bc8cf8d7bd44e9b8efab6722f5a0747")!
        case .uploadImage:
            return URL(string: URLS.baseScheme + self.baseURL + self.version + self.path )!
        case .downloadImage:
            return URL(string: URLS.baseScheme + self.baseURL + self.api + self.path )!
        case .dogImage:
            return URL(string: URLS.baseScheme + self.baseURL + self.api + self.path)!
        }
    }
    
}



