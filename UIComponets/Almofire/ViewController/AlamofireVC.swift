//
//  AlamofireVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 01/07/23.
//

import UIKit
import Alamofire
import Kingfisher

class AlamofireVC: UIViewController {

     // MARK: - Variables And Declarations
    var uploadImageAFViewModel = UploadImgAFVM()
    
    // MARK: - IBOutlets
    @IBOutlet weak var imgview: UIImageView!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
    }
    
     // MARK: - Set up
    func setUpViews() {
        let url =  RequestItemsType.dogImage.url
        imgview.kf.setImage(with: url)
        let image = UIImage(named: Constants.Img.arrow)
        bindViewModel()
        uploadImageAFViewModel.uploadImage(image: image)
        
    }
    
    func bindViewModel() {
        uploadImageAFViewModel.onComplition.bind({ data in
            print(data ?? "nil data")
        })
        
        uploadImageAFViewModel.onError.bind({ error in
            print(error ?? "nil error")
        })
        
    }
    
}
