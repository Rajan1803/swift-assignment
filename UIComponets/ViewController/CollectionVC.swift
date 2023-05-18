//
//  CollectionVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 17/05/23.
//

import UIKit

class CollectionVC: UIViewController {

    // MARK: - Enum for collection constants
    private enum CollectionConstants {
        static let numberOfItemsInSection = 30
        static let minimumLineSpacingForSectionAt: CGFloat = 5
        static let insetTop: CGFloat = 20
        static let insetBottom: CGFloat = 30
        static let insentLeft: CGFloat = 300
        static let insetRight: CGFloat = 10
        static let padding: CGFloat = 50
    }
   
//    let numberOfItemsInSection = 30
//    let minimumLineSpacingForSectionAt: CGFloat = 5
//    let insetTop: CGFloat = 20
//    let insetBottom: CGFloat = 30
//    let insentLeft: CGFloat = 300
//    let insetRight: CGFloat = 10
//    let padding: CGFloat = 50
   
    // MARK: - Variables And Declarations
    var imageArray = [UIImage(named: Constants.Img.swiftLogo),UIImage(named: Constants.Img.javaScript),UIImage(named: Constants.Img.python),UIImage(named: Constants.Img.swiftLogo),UIImage(named: Constants.Img.javaScript),UIImage(named: Constants.Img.python),UIImage(named: Constants.Img.swiftLogo),UIImage(named: Constants.Img.javaScript),UIImage(named: Constants.Img.python),UIImage(named: Constants.Img.swiftLogo),UIImage(named: Constants.Img.javaScript),UIImage(named: Constants.Img.python),UIImage(named: Constants.Img.swiftLogo),UIImage(named: Constants.Img.javaScript),UIImage(named: Constants.Img.python),UIImage(named: Constants.Img.swiftLogo),UIImage(named: Constants.Img.javaScript),UIImage(named: Constants.Img.python),UIImage(named: Constants.Img.swiftLogo),UIImage(named: Constants.Img.javaScript),UIImage(named: Constants.Img.python),UIImage(named: Constants.Img.swiftLogo),UIImage(named: Constants.Img.javaScript),UIImage(named: Constants.Img.python),UIImage(named: Constants.Img.swiftLogo),UIImage(named: Constants.Img.javaScript),UIImage(named: Constants.Img.python),UIImage(named: Constants.Img.swiftLogo),UIImage(named: Constants.Img.javaScript),UIImage(named: Constants.Img.python),UIImage(named: Constants.Img.swiftLogo),UIImage(named: Constants.Img.javaScript),UIImage(named: Constants.Img.python),UIImage(named: Constants.Img.swiftLogo),UIImage(named: Constants.Img.javaScript),UIImage(named: Constants.Img.python)]
    let nameArray = ["swift","javascript","python","swift","javascript","python","swift","javascript","python","swift","javascript","python","swift","javascript","python","swift","javascript","python","swift","javascript","python","swift","javascript","python","swift","javascript","python","swift","javascript","python","swift","javascript","python","swift","javascript","python"]
    
    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .gray
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
    }

}

// MARK: Extension for CollectionVC
extension CollectionVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        CollectionConstants.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Collectioncell", for: indexPath) as? CollectionViewCell
        
        cell?.setData(image: imageArray[indexPath.row]!, name: nameArray[indexPath.row ])
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (collectionView.frame.size.width - CollectionConstants.padding)/2
        
        return CGSize(width: size, height: size)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CollectionConstants.minimumLineSpacingForSectionAt
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: CollectionConstants.insetTop, left: CollectionConstants.insentLeft, bottom: CollectionConstants.insetBottom, right: CollectionConstants.insetRight)
    }
    
}
