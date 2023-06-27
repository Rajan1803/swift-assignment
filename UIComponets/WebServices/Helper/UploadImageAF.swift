//
//  UploadImageAF.swift
//  UIComponets
//
//  Created by Rajan Patel on 03/07/23.
//

import Foundation
import UIKit
import Alamofire


extension APIManager {
    
    
    func uploadImageAF(image: UIImage?,responseResult: @escaping ((Result<Data?,AFError>) -> Void)) {
        guard let image else {return }
        guard let imageData = image.pngData() else {
            print("Failed to convert image to data")
            return
        }

        var url = RequestItemsType.uploadImage.url
        url.append(queryItems: [URLQueryItem(name: "key", value: ApiKeys.upload.getKey())])

        
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/png")
        }, to: url)
        .response { response in
            
//            guard let statusCode = response.response?.statusCode else {
//                print("status code", statusCode)
//                return
//
//            }
//
//            if !(200...299).contains(statusCode){
//                complisionHadler(.failure(ApiError.requestFail))
//            }

            
            
            responseResult(response.result)
        }
    }
}
