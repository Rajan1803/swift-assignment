//
//  FoodTableViewCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 05/06/23.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    // constants used in this file
    private enum Constant {
        static let numberOfSections = 1
        static let minimumInteritemSpacingForSectionAt: CGFloat = 0
        static let minimumLineSpacingForSectionAt: CGFloat = 24
        static let categoriesCellHeight: CGFloat = 120
        static let recommendationsCellHeight: CGFloat = 200
        static let discountCellHeight: CGFloat = 160
        static let cheapFoodCellHeight: CGFloat = 200
    }
    
    // MARK: - Variables And Declarations
    var currentSection = 0
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Life cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        collectionView.register(UINib(nibName: Constants.Nib.categoriesCell, bundle: nil), forCellWithReuseIdentifier: Constants.Nib.categoriesCell)
        collectionView.register(UINib(nibName: Constants.Nib.discountClcVCell, bundle: nil), forCellWithReuseIdentifier: Constants.Nib.discountClcVCell)
        collectionView.register(UINib(nibName: Constants.Nib.recommendationsClcVCell, bundle: nil), forCellWithReuseIdentifier: Constants.Nib.recommendationsClcVCell)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

// MARK: Extension for UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension FoodTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Constant.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FoodSection(rawValue: section)?.getNumbersOfItemsInSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch FoodSection(rawValue: currentSection) {
        case .categories:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Nib.categoriesCell, for: indexPath) as? CategoriesCell else { return UICollectionViewCell() }
            
            cell.setUpData(data: Categories.data[indexPath.row])
            return cell
        case .recommendations:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Nib.recommendationsClcVCell, for: indexPath) as? RecommendationsClcVCell else { return UICollectionViewCell() }
            cell.setData(data: FoodModel.data[indexPath.row])
            return cell
        case .discountSection:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Nib.discountClcVCell, for: indexPath) as? DiscountClcVCell else { return UICollectionViewCell() }
            cell.applyCornerRadius(radius: 16)
            return cell
        case .cheapFood:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Nib.recommendationsClcVCell, for: indexPath) as? RecommendationsClcVCell else { return UICollectionViewCell() }
            cell.imgDiscountView?.isHidden = true
                    return cell
        case .none: return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch FoodSection(rawValue: currentSection) {
        case .categories: return CGSize(width: collectionView.frame.size.width / 5, height: Constant.categoriesCellHeight)
        case .recommendations: return  CGSize(width: collectionView.frame.size.width / 2.5, height: Constant.recommendationsCellHeight)
        case .discountSection: return CGSize(width: collectionView.frame.size.width / 1.2 , height: Constant.discountCellHeight)
        case .cheapFood: return CGSize(width: collectionView.frame.width / 2.5, height: Constant.cheapFoodCellHeight)
        case .none: return CGSize(width: 0, height: 0)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Constant.minimumInteritemSpacingForSectionAt
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constant.minimumLineSpacingForSectionAt
    }
    
}
