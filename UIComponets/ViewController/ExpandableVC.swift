//
//  ExpandableVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 16/05/23.
//

import UIKit

class ExpandableVC: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var tblExpand: UITableView!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        tblExpand.delegate = self
        tblExpand.dataSource = self
    }

}

// MARK: Extension for ExpandableVC
extension ExpandableVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Animals.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblExpand.dequeueReusableCell(withIdentifier: Constants.Cell.ExpandableCell, for: indexPath) as? ExpandableCell else { return ExpandableCell() }
        cell.delegate = self
        cell.setData(data: Animals.data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Constants.String.headerTextExpandable
    }
    
}

// MARK: Extension implimenting Protocol Method
extension ExpandableVC: ExpandButtonDelegate {
    
    func expandButtonClicked(cell: ExpandableCell) {
        guard let indexPath = tblExpand.indexPath(for: cell) else {return}
        Animals.data[indexPath.row].isExpanded = !Animals.data[indexPath.row].isExpanded
        tblExpand.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
