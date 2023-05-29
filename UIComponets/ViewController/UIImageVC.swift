//
//  UIImageVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 08/05/23.
//

import UIKit
import AVKit
class UIImageVC: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var imgLocation: UIImageView!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setImgGesture()
        imgLocation.setAnimation(variadic: [UIImage(systemName: Constants.Img.circle)!,UIImage(systemName: Constants.Img.pencil)!,UIImage(systemName: Constants.Img.ractangePrortraitArrowRight)!], duration: 2, repeatCount: 5)
    }
    
    // MARK: - Set up
    private func setImgGesture() {
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(imgLocationClicked))
        imgLocation.addGestureRecognizer(tap)
    }
    
    
    // MARK: - Action
    @objc func imgLocationClicked(_ sender: UITapGestureRecognizer) {
        imgLocation.startAnimating()
        let alertController = UIAlertController(title: "select", message: "select any one", preferredStyle: .actionSheet)
        let cameraAlert = UIAlertAction(title: "camera", style: .default) {_  in
            self.showImagePicker(selectedSource: .camera)
            print("camera")
        }
        let galleryAction = UIAlertAction(title: "gallery", style: .default) {_ in
            self.showImagePicker(selectedSource: .photoLibrary)
            print("gellery")
        }
        alertController.addAction(cameraAlert)
        alertController.addAction(galleryAction)
        self.present(alertController, animated: true)
        print("image clicked")
    }
    
}

// MARK: - Extensions
extension UIImageVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - FUNCTION
    func showImagePicker(selectedSource: UIImagePickerController.SourceType) {
        guard UIImagePickerController.isSourceTypeAvailable(selectedSource) else {
            print("source type note available")
            return
        }
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = selectedSource
        imagePickerController.delegate = self
        imagePickerController.mediaTypes = [Constants.MediaTypes.imageType,Constants.MediaTypes.movieType]
        imagePickerController.allowsEditing = true
        self.present(imagePickerController, animated: true)
    }
    
    // MARK: - FUNCTION
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true)
        let videoURL = info[UIImagePickerController.InfoKey.mediaURL] as! URL
        print(videoURL)
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }
    // MARK: - FUNCTION
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
        print(Constants.String.cancel)
    }
    
}
