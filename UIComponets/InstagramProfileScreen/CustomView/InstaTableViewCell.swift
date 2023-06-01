//
//  InstaTableViewCell.swift
//  UIComponets
//
//  Created by Rajan Patel on 02/06/23.
//

import UIKit

class InstaTableViewCell: UITableViewCell {

    enum Constant {
        static let minimumLineSpacingForSectionAt: CGFloat = 0.5
        static let minimumInteritemSpacingForSectionAt: CGFloat = 0.5
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var clcViewPost: UICollectionView!
    
    // MARK: - Variables And Declarations
    var currentSegment = 0
    
    // MARK: - Life cycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        clcViewPost.delegate = self
        clcViewPost.dataSource = self
        self.clcViewPost.register(UINib(nibName: Constants.Nib.instaCollectionVCell, bundle: nil), forCellWithReuseIdentifier: Constants.Nib.instaCollectionVCell)
    }

}

// MARK: Extension for UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension InstaTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return InstaSegment(rawValue: currentSegment)?.getCount() ?? 0

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = clcViewPost.dequeueReusableCell(withReuseIdentifier: Constants.Nib.instaCollectionVCell, for: indexPath) as? InstaCollectionVCell else { return CollectionViewCell() }
        cell.setData(data: InstaSegment(rawValue: currentSegment)?.getImage(index: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (clcViewPost.frame.width / 3) - 1.5 , height: collectionView.frame.width / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Constant.minimumLineSpacingForSectionAt
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Constant.minimumInteritemSpacingForSectionAt
    }
    
}
