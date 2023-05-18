//
//  CollectionVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 17/05/23.
//

import UIKit

class CollectionVC: UIViewController {

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
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell
        
        cell?.setData(image: imageArray[indexPath.row]!, name: nameArray[indexPath.row ])
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = (collectionView.frame.size.width - 50)/2
        
        return CGSize(width: size, height: size)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 30, bottom: 300, right: 10)
    }
    
}
