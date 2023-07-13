//
//  ImageDownloadHelper.swift
//  UIComponets
//
//  Created by Rajan Patel on 30/06/23.
//

import Foundation
import UIKit
import Reachability

extension APIManager {
    
    func downloadImage() {
        
        do {
            if try Reachability().connection == .unavailable {
                print("NO INTERNET CONNECTION")
                return
            }
        }catch {
            print(error)
        }
        //"https://sample-videos.com/img/Sample-jpg-image-30mb.jpg"
        let url = RequestItemsType.downloadImage.url
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: .main)
        session.downloadTask(with: url).resume()
    }
}

extension APIManager: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        do {
            let data = try Data(contentsOf: location)
            guard let image = UIImage(data: data) else { return  }
            responseImage?(image)
        }catch {
            print(error)
        }
        
        
    }
}
