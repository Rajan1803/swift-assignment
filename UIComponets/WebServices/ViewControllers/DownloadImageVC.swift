//
//  DownloadImageVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 28/06/23.
//

import UIKit
import Reachability



class DownloadImageVC: UIViewController {
    
    // MARK: - Variables And Declarations
    let downloadImageViewModel = DownloadImageViewModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var btnDownload: UIButton!
    @IBOutlet weak var imgvDownloaded: UIImageView!
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Life cycle Methods
    func setUpViews() {
      bindViewModel()
    }
    
    // MARK: - IBActions
    @IBAction func btnDownloadClicked(_ sender: Any) {
        getImage()
    }
    
    func bindViewModel() {
        downloadImageViewModel.responseImage.bind({[weak self] image in
            guard let self else {return }
            self.imgvDownloaded.image = image
        })
    }
    
    // function to get image from server
    func getImage() {

        downloadImageViewModel.downloadImage()

    }
    
    
}
