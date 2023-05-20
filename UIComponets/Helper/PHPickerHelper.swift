//
//  PHPickerHelper.swift
//  UIComponets
//
//  Created by Rajan Patel on 10/05/23.
//

import UIKit
import PhotosUI

// MARK: - Helper Class To Pick Image Using PHPicker
class PHPickerHelper {
    
    // MARK: - Variables And Declarations
    var imageView: UIImageView?
  
    // MARK: - Set up
    func setPHPicker(viewController: UIViewController) {
        var phConfig = PHPickerConfiguration()
        phConfig.selectionLimit = 1
        phConfig.filter = PHPickerFilter.any(of: [.images, .videos])
        let phPickerVC = PHPickerViewController(configuration: phConfig)
        phPickerVC.delegate = self
        viewController.present(phPickerVC, animated: true)
    }
    
}

// MARK: Extension
extension PHPickerHelper: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true, completion: .none)
        results.forEach { result in
            result.itemProvider.loadObject(ofClass: UIImage.self, completionHandler: {
                reading, error in
                guard let image = reading as? UIImage , error == nil else { print("error"); return }
                DispatchQueue.main.async {
                    self.imageView?.image = image
                }
            })
        }
    }
    
}
