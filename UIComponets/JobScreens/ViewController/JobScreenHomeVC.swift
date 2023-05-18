//
//  JobScreenHomeVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 18/05/23.
//

import UIKit

class JobScreenHomeVC: BaseViewController {
    
    // MARK: - Enum for table view constants
    private enum TableViewConstants {
        
        static let numberOfRowsInSection = 1
        static let numberOfSections = 2
        static let tableRowHeight: CGFloat = 200
        static let heightForHeaderInSection: CGFloat = 50
        
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var tblViewJobHome: UITableView!
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var txtfSearch: UITextField!
    @IBOutlet weak var tableViewHeader: UIView!
    @IBOutlet weak var imgBusinessMan: UIImageView!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        tblViewJobHome.delegate = self
        tblViewJobHome.dataSource = self
        imgBusinessMan.applyCornerRadius(radius: 10)
        let dotImageView = UIImageView(frame: CGRect(x: imgBusinessMan.bounds.width - 15, y: 0, width: 15, height: 15))
        dotImageView.applyCornerRadius(radius: Int(dotImageView.frame.size.height)/2)
        dotImageView.contentMode = .scaleAspectFit
        dotImageView.borderWidth = 3
        dotImageView.borderColor = .white
        dotImageView.image = UIImage(named: Constants.Img.ellipse)
        imgBusinessMan.addSubview(dotImageView)
        txtfSearch.setTextFieldLeftImage(padding: 30, image: UIImage(named: Constants.Img.search))
        btnFilter.applyCornerRadius(radius: 10)
        txtfSearch.applyCornerRadius(radius: 12)
        let headerNib = UINib(nibName: Constants.Nib.jobHomeTblHeader, bundle: nil)
        tblViewJobHome.register(headerNib, forHeaderFooterViewReuseIdentifier: Constants.Nib.jobHomeTblHeader)
    }
    
}

// MARK: Extension for JobScreenHomeVC
extension JobScreenHomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        TableViewConstants.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TableViewConstants.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblViewJobHome.dequeueReusableCell(withIdentifier: Constants.Cell.JobHomeScreenTableCell, for: indexPath) as? JobHomeScreenTableCell else { return UITableViewCell() }
        cell.setData(currentSection: indexPath.section)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         JobTypes(rawValue: indexPath.row)?.getHeightForRow() ?? 0
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        TableViewConstants.tableRowHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tblViewJobHome.dequeueReusableHeaderFooterView(withIdentifier: Constants.Nib.JobTblVHeader) as? JobTblVHeader else {return UIView()}
        headerView.lblTblSectionHeader.text = JobTypes(rawValue: section)?.getHeaderTitle()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        TableViewConstants.heightForHeaderInSection
    }
    
}
