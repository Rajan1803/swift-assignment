//
//  DownloadImageViewModel.swift
//  UIComponets
//
//  Created by Rajan Patel on 30/06/23.
//

import Foundation
import UIKit

class DownloadImageViewModel {
    
    // MARK: - Variables And Declarations
    var responseImage = Dynamic<UIImage?>(nil)
    
    // func download image from server
    func downloadImage() {
        APIManager.shared.responseImage = { [weak self] image in
            guard let self else {return }
            self.responseImage.value = image
        }
        APIManager.shared.downloadImage()
    }
}
