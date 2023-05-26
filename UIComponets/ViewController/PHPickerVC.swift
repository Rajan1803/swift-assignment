//
//  PHPickerVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 09/05/23.
//
import PhotosUI
import UIKit

class PHPickerVC: BaseViewController {
    
    // MARK: - Variables And Declarations
    private var phPickerHelper = PHPickerHelper()
    // MARK: - IBOutlets
    @IBOutlet private weak var imgView: UIImageView!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction func btnChooseClicked(_ sender: UIButton) {
        phPickerHelper.imageView = imgView
        phPickerHelper.setPHPicker(viewController: self)
        //        setPHPicker()
    }
    
}

