//
//  TableViewHeader.swift
//  UIComponets
//
//  Created by Rajan Patel on 02/06/23.
//

import UIKit

class TableViewHeader: UIView {

    // MARK: - IBOutlets
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var txtVBio: UITextView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnContact: UIButton!
    @IBOutlet weak var btnInsight: UIButton!
    @IBOutlet weak var btnPromotion: UIButton!
    @IBOutlet weak var btnEditProfile: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lblPostCount: UILabel!
    
    // MARK: - FUNCTION
    class func instanceFromNib() -> UIView {
    guard let header = UINib(nibName: Constants.Nib.tableViewHeader, bundle: nil).instantiate(withOwner: nil)[0] as? TableViewHeader else { return UIView() }
        [header.btnInsight, header.btnContact, header.btnPromotion, header.btnEditProfile].forEach{ $0?.applyBorderColor(borderColor: UIColor.lightGray.cgColor, borderWidth: 2)
            $0?.applyCornerRadius(radius: 5)
        }
        header.collectionView.register(UINib(nibName: Constants.Nib.statusCollectionVCell, bundle: Bundle.main), forCellWithReuseIdentifier: Constants.Cell.statusCollectionVCell)
        header.collectionView.delegate = header
        header.collectionView.dataSource = header
        header.txtVBio.textContainer.lineFragmentPadding = 0
        header.lblPostCount.text = String(InstaStory.tagedPosts.count + InstaStory.reels.count + InstaStory.uploadedPost.count)
        header.imgProfile.applyCornerRadius(radius: Int(header.imgProfile.frame.height) / 2 )
        
        return header
    }
    
    // MARK: - IBActions
    @IBAction func btnEditProfileClicked(_ sender: UIButton) {
        if sender.titleLabel?.text == Constants.String.editProfile {
            sender.setTitle(Constants.String.doneButtonTitle, for: .normal)
            txtVBio.isEditable = true
            txtVBio.becomeFirstResponder()
        } else {
            txtVBio.resignFirstResponder()
            txtVBio.isEditable = false
            sender.setTitle(Constants.String.editProfile, for: .normal)
        }
    }
    
}

// MARK: Extension for UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension TableViewHeader: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        InstaStory.stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Nib.statusCollectionVCell, for: indexPath) as? StatusCollectionVCell else { return UICollectionViewCell() }
        cell.setData(data: InstaStory.stories[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 5, height: collectionView.frame.size.width / 5 + 30)
    }

}
