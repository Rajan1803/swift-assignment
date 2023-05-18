//
//  JobCollectionVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 17/05/23.
//

import UIKit

class JobCollectionVC: UIViewController {

    // MARK: - Variables And Declarations
    let padding: CGFloat = 60
    let HeaderHeight: CGFloat = 50
    
    // MARK: - IBOutlets
    @IBOutlet weak var txtfSearch: UITextField!
    @IBOutlet weak var collectionViewJob: UICollectionView!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Set up
    func setUpViews() {
        collectionViewJob.delegate = self
        collectionViewJob.dataSource = self
        let nibCell = UINib(nibName: Constants.Nib.jobCollectionCell, bundle: nil)
        collectionViewJob.register(nibCell, forCellWithReuseIdentifier: Constants.Nib.jobCollectionCell)
        collectionViewJob.register(UINib(nibName: Constants.Nib.jobHeader, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.Nib.jobHeader)
        txtfSearch.borderStyle = .none
        txtfSearch.setTextFieldLeftImage(padding: 20, image: UIImage(named: Constants.Img.Arrow))
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
        
        switch Sections(rawValue: indexPath.section) {
        case .recommended:  cell.setData(data: JobModel.dictionaryOfJobs[Constants.dictionaryKeys.recomendedJobs]![indexPath.row])
        case .populer: cell.setData(data: JobModel.dictionaryOfJobs[Constants.dictionaryKeys.populerJobs]![indexPath.row])
        case .none: print("invalid")
        
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionViewJob.frame.size.width - padding)/2
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
        return UIEdgeInsets(top: 0, left: 24, bottom: 10, right: 24)
    }
    
}
