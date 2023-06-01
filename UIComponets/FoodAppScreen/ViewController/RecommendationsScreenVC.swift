//
//  RecommendationsScreenVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 06/06/23.
//

import UIKit

class RecommendationsScreenVC: UIViewController {

    // constants used in this file
    enum Constant {
        static let numberOfSections = 2
        static let heightForHeaderInSection: CGFloat = 70
    }
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tblViewRecommendations: UITableView!
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        tblViewRecommendations.delegate = self
        tblViewRecommendations.dataSource = self
        tblViewRecommendations.register(UINib(nibName: Constants.Nib.recomendScreenTblVCell, bundle: nil), forCellReuseIdentifier: Constants.Nib.recomendScreenTblVCell)
        tblViewRecommendations.register(UINib(nibName: Constants.Nib.recomendScreenSectionHeader, bundle: nil), forCellReuseIdentifier: Constants.Nib.recomendScreenSectionHeader)

        navigationController?.navigationBar.topItem?.backButtonTitle = Constants.String.navBackButtonTitle
        navigationController?.navigationBar.tintColor = .white

    }
    
}

// MARK: Extension for UITableViewDelegate, UITableViewDataSource
extension RecommendationsScreenVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constant.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        RecomandedSections(rawValue: section)?.getItemCount() ?? 00
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblViewRecommendations.dequeueReusableCell(withIdentifier: Constants.Nib.recomendScreenTblVCell, for: indexPath) as? RecomendScreenTblVCell else  { return UITableViewCell() }
        
        switch RecomandedSections(rawValue: indexPath.section) {
        case .bambooRestaurant: cell.setData(data: RecomandedFoods.bambooFoods[indexPath.row])
        case .familyRestaurant: cell.setData(data: RecomandedFoods.familyFoods[indexPath.row])
        case .none: cell.setData(data: RecomandedFoods.bambooFoods[indexPath.row])
        }
        return cell
    }
    
 
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       guard let headerView = UINib(nibName: Constants.Nib.recomendScreenSectionHeader, bundle: nil).instantiate(withOwner: nil)[0] as? RecomendScreenSectionHeader else { return UIView()}
        headerView.setUpViews(data: RecomandedSection.data[section])
        headerView.isHidden = RecomandedSections(rawValue: section)?.isSectionEmpty(section: section) ?? false
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constant.heightForHeaderInSection
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let btnDelete = UIContextualAction(style: .destructive, title: Constants.String.deleteAction, handler: { _,_,_ in
            RecomandedSections(rawValue: indexPath.section)?.removeElement(index: indexPath.row)
            tableView.reloadData()
        })
        return UISwipeActionsConfiguration(actions: [btnDelete])
    }
    
}
