//
//  JobCollectionVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 17/05/23.
//

import UIKit

class JobCollectionVC: BaseViewController {

    // MARK: - Enum for collection  constants
    private enum CollectionConstants {
        
        static let padding: CGFloat = 60
        static let HeaderHeight: CGFloat = 50
        static let insetTop: CGFloat = 0
        static let insetBottom: CGFloat = 24
        static let insetLeft: CGFloat = 10
        static let insetRight: CGFloat = 24
        
    }
  
    // MARK: - IBOutlets
    @IBOutlet weak var txtfSearch: UITextField!
    @IBOutlet weak var collectionViewJob: UICollectionView!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        collectionViewJob.delegate = self
        collectionViewJob.dataSource = self
        txtfSearch.delegate = self
        let nibCell = UINib(nibName: Constants.Nib.jobCollectionCell, bundle: nil)
        collectionViewJob.register(nibCell, forCellWithReuseIdentifier: Constants.Nib.jobCollectionCell)
        collectionViewJob.register(UINib(nibName: Constants.Nib.jobHeader, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.Nib.jobHeader)
        txtfSearch.borderStyle = .none
        txtfSearch.setTextFieldLeftImage(padding: 20, image: UIImage(named: Constants.Img.arrow))
        txtfSearch.setTextFieldRightImage(image: UIImage(named: Constants.Img.cross))
        txtfSearch.font = txtfSearch.font?.withSize(16)
    }
    
}

// MARK: Extension for JobCollectionVC
extension JobCollectionVC: UICollectionViewDelegateFlowLayout , UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         Sections(rawValue: section)?.getNumberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionViewJob.dequeueReusableCell(withReuseIdentifier: Constants.Nib.jobCollectionCell, for: indexPath) as? JobCollectionCell else {
            return UICollectionViewCell()
        }

        if let recommendedJobs = JobModel.dictionaryOfJobs[Constants.dictionaryKeys.recomendedJobs] ,let populerJobs = JobModel.dictionaryOfJobs[Constants.dictionaryKeys.populerJobs] {
            switch Sections(rawValue: indexPath.section) {
                
            case .recommended:  cell.setData(data: recommendedJobs[indexPath.row])
            case .populer: cell.setData(data: populerJobs[indexPath.row])
            case .none: print("invalid")
            
            }
        }
        
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionViewJob.frame.size.width - CollectionConstants.padding)/2
        return CGSize(width: size, height: size)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return JobModel.dictionaryOfJobs.keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
            case UICollectionView.elementKindSectionHeader:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.Nib.jobHeader, for: indexPath) as? JobHeader else {return UICollectionReusableView()}
            
            headerView.lblHeaderTitle.text = Sections(rawValue: indexPath.section)?.getHeader()
                return headerView
            default: print("default case")
            
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section != 0 {
            return CGSize(width: collectionViewJob.frame.size.width, height: 50)
        }
        return CGSize(width: collectionViewJob.frame.size.width, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: CollectionConstants.insetTop, left: CollectionConstants.insetLeft, bottom: CollectionConstants.insetBottom, right: CollectionConstants.insetRight)
    }
    
}

// MARK: Extension of job CollectionVC for UITextFieldDelegate
extension JobCollectionVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
