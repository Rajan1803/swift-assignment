//
//  TableViewVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 12/05/23.
//

import UIKit

class TableViewVC: BaseViewController {
    
    // MARK: - Variables And Declarations
    let numberOfSections = 1
    var txtfNames: UITextField?
    var names = ["rajan","sagar","priyanshu"]
    var images = [UIImage(named: Constants.Img.swiftLogo),UIImage(named: Constants.Img.javaScript),UIImage(named: Constants.Img.python)]
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    @IBAction func btnAddItemClicked(_ sender: UIButton) {
        names.append("rajan")
        images.append(UIImage(named: Constants.Img.swiftLogo))
        tableView.reloadData()
    }
    // MARK: - Set up
    func setUpViews() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func editRowText(indexPath: IndexPath) {
        let alertController = UIAlertController(title: Constants.String.alertControllerTitle, message: Constants.String.alertControllerMessege, preferredStyle: .alert)
        let update = UIAlertAction(title: Constants.String.updateActionString, style: .default) { [weak self] ac in
            self?.names[indexPath.row] = self?.txtfNames?.text ?? ""
            DispatchQueue.main.async {
                
                self?.tableView.reloadData()
            }

        }
        let cencel = UIAlertAction(title: Constants.String.cencelActionString, style: .default) {_ in
            print("cencel")
        }
        alertController.addAction(update)
        alertController.addAction(cencel)
        alertController.addTextField() { [weak self] textfield in
            textfield.text = self?.names[indexPath.row]
            textfield.placeholder = Constants.String.tableViewPlaceholder
            self?.txtfNames = textfield
            print(textfield.text ?? "")
            
        }
        present(alertController, animated: true)
        print(indexPath[1])
    }
    
}
// MARK: Extension
extension TableViewVC: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        numberOfSections
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        editRowText(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            names.remove(at: indexPath.row)
            images.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}

// MARK: Extension for TableViewVC
extension TableViewVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cell.practiceCell, for: indexPath) as? TableViewCell
        cell?.lblName.text = names[indexPath.row]
        cell?.lblRole.text = Constants.String.traineeRole
        cell?.imgLogo.image = images[indexPath.row]
        return cell ?? TableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: Constants.String.editAction, handler:{ [weak self] _, _, _  in
            self?.editRowText(indexPath: indexPath)
            print("edit tapped")
        })
        
        let delete = UIContextualAction(style: .destructive, title: Constants.String.deleteAction, handler: { [weak self] _,_,_ in
            print("delete tapped")
            self?.names.remove(at: indexPath.row)
            self?.images.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        })
        return UISwipeActionsConfiguration(actions: [delete,edit])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let moreButton = UIContextualAction(style: .destructive, title: Constants.String.moreAction, handler: { _,_,_ in
            print("more tapped")})
            return UISwipeActionsConfiguration(actions: [moreButton])
    }
    
}
