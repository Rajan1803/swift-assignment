//
//  UploadImageAFVM.swift
//  UIComponets
//
//  Created by Rajan Patel on 03/07/23.
//

import Foundation
import UIKit


class UploadImgAFVM {
    
    var onComplition = Dynamic<Data?>(nil)
    var onError =  Dynamic<Error?>(nil)
    
    func uploadImage(image: UIImage?) {
        
        APIManager.shared.uploadImageAF(image: image){[weak self] result in
            switch result {
            case .success(let success):
                self?.onComplition.value = success
            case .failure(let failure):
                self?.onError.value = failure
            }

        }
    }
}
