//
//  SegueDataPassVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 29/05/23.
//

import UIKit

class SegueDataPassVC: BaseViewController {

    enum Constant {
        static let btnWidth = 50
        static let btnHeight = 30
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var lblInputText: UILabel!
    
    // MARK: - Variables And Declarations
    var inputText: String?
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        lblInputText.text = inputText
        navigationItem.title = "RP"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        let customView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 35))
        let btnFirst = UIButton(frame: CGRect(x: 0, y: 0, width: Constant.btnWidth, height: Constant.btnHeight))
        btnFirst.setTitle("Close", for: .normal)
        
        btnFirst.tintColor = .blue
        btnFirst.setTitleColor(.blue, for: .normal)
        let btnSecond = UIButton(frame: CGRect(x: Constant.btnWidth + 10, y: 0, width: Constant.btnWidth, height: Constant.btnHeight))
        btnSecond.setTitleColor(.blue, for: .normal)
        btnSecond.setTitle("Edit", for: .normal)
        customView.addSubview(btnFirst)
        customView.addSubview(btnSecond)
        let barButtonItem = UIBarButtonItem(customView: customView)
        navigationItem.titleView = customView
    }
    
}
