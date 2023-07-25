//
//  UploadImageViewModel.swift
//  UIComponets
//
//  Created by Rajan Patel on 30/06/23.
//

import Foundation
import UIKit

class UploadImageViewModel {
    
    // MARK: - Variables And Declarations
    var progress = Dynamic<Float>(0.0)
    
    //function to upload image
    func uploadImage(imageView: UIImageView) {
        APIManager.shared.uploadImaggeUsingBinary(imageView: imageView, progress: { [weak self] progress in
            guard let self else {return }
            self.progress.value = progress
        })
    }
}

