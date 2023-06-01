//
//  InstagramProfileVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 02/06/23.
//

import UIKit

class InstagramProfileVC: UIViewController {
    
    // MARK: - Variables And Declarations
    enum Constant {
        
        static let heightForRowAt: CGFloat = 800
        static let numberOfRowsInSection = 1
        
    }
    
    // MARK: - Variables And Declarations
    var currentSegment = 0
    
    // MARK: - IBOutlets
    @IBOutlet weak var tblView: UITableView!
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Set up
    func setUpViews() {
        tblView.delegate = self
        tblView.dataSource = self
        tblView.tableHeaderView = TableViewHeader.instanceFromNib()
        let lblNavigation = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: (navigationController?.navigationBar.frame.height) ?? 0))
        lblNavigation.font = UIFont.boldSystemFont(ofSize: 17)
        lblNavigation.text = Constants.String.facebook
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: lblNavigation)
        self.tblView.register(UINib(nibName: Constants.Cell.instaTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Cell.instaTableViewCell)
        tblView.sectionHeaderTopPadding = 0
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        guard let headerView = tblView.tableHeaderView else {return }
        let size = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        if headerView.frame.size.height != size.height {
            headerView.frame.size.height = size.height + 50
            tblView.tableHeaderView = headerView
            print(#function)
        }
    }

}

// MARK: Extension for UITableViewDelegate , UITableViewDataSource
extension InstagramProfileVC: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constant.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblView.dequeueReusableCell(withIdentifier: Constants.Cell.instaTableViewCell,for: indexPath) as? InstaTableViewCell else { return UITableViewCell() }
        
        cell.currentSegment = currentSegment
        cell.clcViewPost.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = TableSectionHeader.initWithNib()
        sectionHeader.delegate = self
        return sectionHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constant.heightForRowAt
    }
    
}

// MARK: Extension for SegmentContol
extension InstagramProfileVC: SegmentContol {
    
    func segmentValueChange(value: Int) {
        currentSegment = value
        tblView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        print(value)
    }
    
}
