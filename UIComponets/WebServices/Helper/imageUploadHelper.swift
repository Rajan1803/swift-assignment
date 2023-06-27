//
//  ImageUploadViewModel.swift
//  UIComponets
//
//  Created by Rajan Patel on 29/06/23.
//

import Foundation

import UIKit
import Reachability

extension APIManager {
    
    
    // for uploading an image
    func uplaodImage(imageView: UIImageView) {
        
        do {
            if try Reachability().connection == .unavailable {
                print("NO INTERNET CONNECTION")
                return
            }
        }catch {
            print(error)
        }
            var url = RequestItemsType.uploadImage.url
        url.append(queryItems: [URLQueryItem(name: "key", value: ApiKeys.upload.getKey())])
            
            var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = RequestItemsType.uploadImage.httpMethod.rawValue
        guard let pngData = imageView.image?.pngData() else {return }
        let body = urlRequest.setMultipartFormData(params: ["image" : (pngData.base64EncodedString(), nil)])
            
            let uploadTask = URLSession.shared.uploadTask(with: urlRequest, from: body) { (data, urlResponse, error) in
                
                guard error != nil else {
                    print(error)
                    return
                }
                
                guard let httpResponse = urlResponse as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                   print("error")
                  return
                }
                
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(ImageUploadResponse.self, from: data)
                        print(response)
                    } catch let error {
                        print("error \(error)")
                    }
                }
            }
            uploadTask.delegate = self
            uploadTask.resume()
    }
    
    //image upload using BinaryFile
    func uploadImaggeUsingBinary(imageView: UIImageView,progress: @escaping (Float) -> Void ) {
        self.progress = progress
        let urll = RequestItemsType.uploadImage.url
        print(urll)
         var url = RequestItemsType.uploadImage.url
        url.append(queryItems: [URLQueryItem(name: "key", value: ApiKeys.upload.getKey())])

            var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = RequestItemsType.uploadImage.httpMethod.rawValue
        guard let pngData = imageView.image?.pngData() else {return }
            let body = urlRequest.setMultipartFormDataBinaryImage(params: ["image" : (pngData, "upload.jpeg")])

            let uploadTask = URLSession.shared.uploadTask(with: urlRequest, from: body) { (data, urlResponse, error) in
                
                guard error != nil else {
                    print(error)
                    return
                }
                
                guard let httpResponse = urlResponse as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                   print("error")
                  return
                }
                
                
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(ImageUploadResponse.self, from: data)
                        print(response)
                    } catch let error {
                        print("error \(error)")
                    }
                }
            }
            uploadTask.delegate = self
            uploadTask.resume()
    }
    

}

// MARK: Extension for URLSessionTaskDelegate
extension APIManager: URLSessionTaskDelegate {
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        let currentProgress = Float(Float(totalBytesSent)/Float(totalBytesExpectedToSend))
        progress?(currentProgress)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didFinishCollecting metrics: URLSessionTaskMetrics) {
        print("finish")
    }
}
