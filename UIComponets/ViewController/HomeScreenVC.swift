//
//  HomeScreenVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 15/05/23.
//

import UIKit

class HomeScreenVC: BaseViewController {
    
    // MARK: - Enum for table view constants
    private enum TableViewConstants {
        
        static let radius = 20
        static let heightForHeader: CGFloat = 40
        
    }
    
   // MARK: - IBOutlets
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var tblVDocuments: UITableView!
    @IBOutlet weak var txtfSearch: UITextField!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Set up
    func setViews() {
        tblVDocuments.delegate = self
        tblVDocuments.dataSource = self
        topView.applyCornerRadius(radius: TableViewConstants.radius)
        imgUser.applyCornerRadius(radius: Int(imgUser.frame.size.height)/2)
        btnNotification.applyCornerRadius(radius: Int(btnNotification.frame.height) / 2)
        btnFilter.applyCornerRadius(radius: Int(btnFilter.frame.height) / 2)
        txtfSearch.setTextFieldLeftImage(padding: 40, image: UIImage(named: Constants.Img.search)!)
        txtfSearch.applyCornerRadius(radius: TableViewConstants.radius)
        txtfSearch.clipsToBounds = true
        txtfSearch.backgroundColor = UIColor(named: Color.searchBar)
        txtfSearch.attributedPlaceholder = NSAttributedString(string: Constants.String.searchDocument, attributes: [.foregroundColor: UIColor(named: Color.placeholderTextColor)!])
        tblVDocuments.backgroundColor = UIColor(named: Color.cellColor)
    }
  
}

// MARK: Extensions For HomeScreenVC
extension HomeScreenVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Document.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVDocuments.dequeueReusableCell(withIdentifier: Constants.Cell.homeScreenCell, for: indexPath) as? HomeScreenCell
        cell?.setData(data: Document.data[indexPath.row])
        cell?.delegate = self
        return cell ?? HomeScreenCell()
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: tblVDocuments.frame.width, height: 40))
        let headerTxt = UILabel(frame: CGRect(x: 0, y: 20, width: headerView.frame.width, height: 20))
        headerTxt.text = Constants.String.allDocuments
        headerView.addSubview(headerTxt)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TableViewConstants.heightForHeader
    }
    
}

// MARK: Extensions For HomeScreenVC
extension HomeScreenVC: StatusBtnDelegate {
   
    func statusButtonClicked(cell: HomeScreenCell) {
        guard let indexPath = tblVDocuments.indexPath(for: cell) else {return}
        Document.data[indexPath.row].status.switchStatus()
        tblVDocuments.reloadRows(at: [indexPath], with: .automatic)
        
    }
    
}
