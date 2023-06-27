//
//  UploadVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 29/06/23.
//

import UIKit
import PhotosUI

class UploadVC: UIViewController, Storyboarded {
    
    // MARK: - Variables And Declarations
    let downloadImageViewModel = DownloadImageViewModel()
    private let uploadImageViewModel = UploadImageViewModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnDownload: UIButton!
    @IBOutlet weak var imgDownloaded: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUploadViewModel()
        bindDownloadViewModel()
    }
    
    // MARK: - Bind ViewModel
    func bindUploadViewModel() {
        uploadImageViewModel.progress.bind({ progress in
            DispatchQueue.main.async {
                self.progressView.progress = progress
            }
            print(progress)
        })
    }

    func bindDownloadViewModel() {
        downloadImageViewModel.responseImage.bind({[weak self] image in
            guard let self else {return }
            self.imgDownloaded.image = image
        })
    }
    
    // function to get image from server
    func getImage() {

        downloadImageViewModel.downloadImage()

    }
    
    // MARK: - Actions
    @IBAction func btnChooseClicked(_ sender: UIButton) {
        PHPickerHelper.shared.pick(self, imageCompletionHandler: { [weak self] image in
            guard let self else {return}
            self.imgView.image = image
        }, videoCompletionHandler: nil)
    }
    
    @IBAction func btnUploadClicked(_ sender: UIButton) {
        uploadImageViewModel.uploadImage(imageView: imgView)
    }
    
    
    @IBAction func btnDownloadClicked(_ sender: Any) {
        getImage()
    }
    
}


