//
//  BottomSheetVC.swift
//  News
//
//  Created by Rajan Patel on 17/07/23.
//

import UIKit

class BottomSheetVC: UIViewController {

    // MARK: - Variables And Declarations
    var currentPosition: Int?
    
    // MARK: - IBOutlets
    @IBOutlet weak var imgBookmark: UIImageView!
    @IBOutlet weak var viewOpenInBrowser: UIView!
    @IBOutlet weak var viewSave: UIView!
    @IBOutlet weak var viewShare: UIView!
    
    @IBOutlet weak var lblSave: UILabel!
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
       initViews()
    }
    
    func initViews() {
        let shareGesterRecognizer = UITapGestureRecognizer(target: self, action: #selector(shareClicked))
        let saveGesterRecognizer = UITapGestureRecognizer(target: self, action: #selector(saveClicked))
        let browserGesterRecognizer = UITapGestureRecognizer(target: self, action: #selector(browserClicked))
        viewShare.addGestureRecognizer(shareGesterRecognizer)
        viewSave.addGestureRecognizer(saveGesterRecognizer)
        viewOpenInBrowser.addGestureRecognizer(browserGesterRecognizer)
        guard let currentPosition else {return }
        if(Article.listOfAticles[currentPosition].isSelected) {
            imgBookmark.image = R.image.saved()
            lblSave.text = AppConstants.String.removeFromSave
        }else {
            imgBookmark.image = R.image.bookmark()
            lblSave.text = AppConstants.String.saveForLater
        }
    }
    
     // MARK: - Actions
    @objc func shareClicked(sender: UIGestureRecognizer) {
        let objectsToShare = [AppConstants.String.message,AppConstants.String.link] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
        
    }
    
    @objc func saveClicked(sender: UIGestureRecognizer) {
        guard let currentPosition else {return }
        Article.listOfAticles[currentPosition].isSelected = !Article.listOfAticles[currentPosition].isSelected
        
        if(Article.listOfAticles[currentPosition].isSelected) {
            imgBookmark.image = R.image.saved()
            lblSave.text = AppConstants.String.removeFromSave
        }else {
            imgBookmark.image = R.image.bookmark()
            lblSave.text = AppConstants.String.saveForLater
        }
        self.dismiss(animated: true)
        
    }
    
    @objc func browserClicked(sender: UIGestureRecognizer) {
        guard let currentPosition else {return }
        guard let urlString = Article.listOfAticles[currentPosition].url else {return }
        let url = URL(string:urlString)
        guard let url else {return }
        UIApplication.shared.open(url)
        self.dismiss(animated: true)
    }
    
}
