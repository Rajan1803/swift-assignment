//
//  JobHomeScreenTableCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 18/05/23.
//

import UIKit

class JobHomeScreenTableCell: BaseTableViewCell {
    
    // MARK: - Enum for collection constant values
    private enum CollectionConstants {

        static let numberOfItemsInSection = 4
        static let widthPadding: CGFloat = 10
        static let minimumLineSpacingForSection: CGFloat = 20
        static let additinalPadding: CGFloat = 20
        static let zero: CGFloat = 0
        
    }
    
    // MARK: - Variables And Declarations
    var section = 0
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Life cycle Method
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        collectionView.register(UINib(nibName: Constants.Cell.jobHomeScreenCell, bundle: nil), forCellWithReuseIdentifier: Constants.Cell.jobHomeScreenCell)
        pageControl.currentPage = 0
        pageControl.numberOfPages = CollectionConstants.numberOfItemsInSection
        pageControl.preferredCurrentPageIndicatorImage = UIImage(named: Constants.String.pageControl)
        let nibCell = UINib(nibName: Constants.Nib.jobCollectionCell, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: Constants.Nib.jobCollectionCell)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setData(currentSection: Int) {
        if currentSection == 1 {
            self.pageControl.isHidden = true
        }
        section = currentSection
    }

}

// MARK: Extension for jobHomeScreenTableCell
extension JobHomeScreenTableCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        CollectionConstants.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch JobTypes(rawValue: section) {
        case .featuredJob: guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cell.jobHomeScreenCell, for: indexPath) as? JobHomeScreenCell else { return UICollectionViewCell() }
            cell.setData(indexPath: indexPath)
            return cell
        case .populerJobs:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Nib.jobCollectionCell, for: indexPath) as? JobCollectionCell else {
                return UICollectionViewCell()
            }
              cell.setData(data: JobModel.dictionaryOfJobs[Constants.dictionaryKeys.recomendedJobs]![indexPath.row])
            return cell
        case .none: return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch JobTypes(rawValue: section) {
        case .featuredJob: return CGSize(width: collectionView.frame.size.width - CollectionConstants.widthPadding, height: collectionView.frame.height)
        case .populerJobs:  return CGSize(width: (collectionView.frame.size.width - CollectionConstants.widthPadding - CollectionConstants.additinalPadding) / 2, height: collectionView.frame.height)
        case .none: return CGSize(width: CollectionConstants.zero, height: CollectionConstants.zero)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: CollectionConstants.zero, left: CollectionConstants.zero, bottom: CollectionConstants.zero, right: CollectionConstants.zero)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CollectionConstants.minimumLineSpacingForSection
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        CollectionConstants.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
    
}
