//
//  FoodAppScreenVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 05/06/23.
//

import UIKit

class FoodAppScreenVC: BaseViewController {
    
    // constants used in this file
    enum Constant {
        static let numberOfSections = 4
        static let numberOfRowsInSection = 1
    }

    // MARK: - IBOutlets
    @IBOutlet private weak var topContainerView: UIView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var viewForNotificationButton: UIView!
    @IBOutlet private weak var btnProfile: UIButton!
    @IBOutlet private weak var btnNotification: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.Nib.foodTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Nib.foodTableViewCell)
        tableView.register(UINib(nibName: Constants.Nib.foodTableHeader, bundle: nil), forCellReuseIdentifier: Constants.Nib.foodTableHeader)
        tableView.register(UINib(nibName: Constants.Nib.discountSectionHeader, bundle: nil), forCellReuseIdentifier: Constants.Nib.discountSectionHeader)
        let tableHeaderView = UINib(nibName: Constants.Nib.foodTableHeader, bundle: nil).instantiate(withOwner: nil)[0] as? FoodTableHeader
        tableView.tableHeaderView = tableHeaderView
        tableView.sectionHeaderTopPadding = 0
        btnNotification.applyCornerRadius(radius: Int(btnNotification.frame.height)/2)
        btnProfile.applyCornerRadius(radius: Int(btnProfile.frame.height/2))
        btnProfile.applyBorderColor(borderColor: UIColor.lightGray.cgColor, borderWidth: 1)
        btnNotification.applyBorderColor(borderColor: UIColor.lightGray.cgColor, borderWidth: 1)
        searchBar.applyCornerRadius(radius: 8)
        let badgeButton = UIButton(frame: CGRect(x: viewForNotificationButton.frame.width - 10, y: 0, width: 10, height: 10))
        badgeButton.applyCornerRadius(radius: 5)
        badgeButton.applyBorderColor(borderColor: UIColor.white.cgColor, borderWidth: 1)
        badgeButton.backgroundColor = .red
        viewForNotificationButton.addSubview(badgeButton)
        topContainerView.applyCornerRadius(radius: 16)
        topContainerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let headerView = tableView.tableHeaderView else {return }
        let size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        if headerView.frame.size.height != size.height {
            headerView.frame.size.height = size.height
            tableView.tableHeaderView = headerView
            print(#function)

        }
    }
    
}

// MARK: Extension for UITableViewDelegate, UITableViewDataSource
extension FoodAppScreenVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Constant.numberOfSections
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constant.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Nib.foodTableViewCell, for: indexPath) as? FoodTableViewCell else { return UITableViewCell() }
        cell.currentSection = indexPath.section
        return cell

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        
        switch FoodSection(rawValue: section) {
        case .categories:
            let title = UILabel(frame: CGRect(x: 12, y: 15, width: tableView.frame.width, height: 30))
            title.text = "Categories"
            title.font = UIFont.boldSystemFont(ofSize: 16)
            let headerView = UIView()
            headerView.applyCornerRadius(radius: 16)
            headerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] 
            headerView.backgroundColor = UIColor(named: Color.tblViewBgr)
            headerView.addSubview(title)
            return headerView
        
        case .recommendations:
            let headerView = UINib(nibName: Constants.Nib.tableViewSectionHeader, bundle: nil).instantiate(withOwner: nil)[0] as? TableViewSectionHeader
            headerView?.delegate = self
            return headerView
        case .discountSection:
            let headderView = UINib(nibName: Constants.Nib.discountSectionHeader, bundle: nil).instantiate(withOwner: nil)[0] as? DiscountSectionHeader
            return headderView
            
        case .cheapFood:
            let headerView = UINib(nibName: Constants.Nib.tableViewSectionHeader, bundle: nil).instantiate(withOwner: nil)[0] as? TableViewSectionHeader
            headerView?.delegate = self
            headerView?.setUpForSecondHeader()
            return headerView
        case .none: return UIView()
        }

    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      
        return FoodSection(rawValue: section)?.getHeightForHeaderInSection() ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        FoodSection(rawValue: indexPath.section)?.getheightForRow() ?? 0
    }
    
}

extension FoodAppScreenVC: LoadSecondVCDelegate {
    func seeAllButtonClicked() {
        guard let recomandationVC = storyboard?.instantiateViewController(withIdentifier: Constants.ViewController.recommendationsScreenVC) as? RecommendationsScreenVC else { return }
        navigationController?.pushViewController(recomandationVC, animated: true)
    }
    
    
}
