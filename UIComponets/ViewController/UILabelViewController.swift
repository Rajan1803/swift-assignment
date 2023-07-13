//
//  UILabelViewController.swift
//  UIComponets
//
//  Created by Rajan Patel on 25/04/23.
//

import UIKit

class UILabelViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private  weak var lblUserName: UILabel!
    
    // MARK: - Variables And Declarations
    private var lblFirstName: UILabel!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpFirstNameLabel()
        setUpGreenLabel()
        attributedStringLabel()
    }
    
     // MARK: - Action
    @objc private func lblFirstNameClicked(_ sender: UITapGestureRecognizer) {
        print("clicked")
    }
    
    // MARK: - Set up
    fileprivate func setUpGreenLabel() {
        let greenLabel = UILabel()
        greenLabel.frame = CGRect(x: 50, y:400, width: 300, height: 40)
        greenLabel.text = Constants.String.addedProgrammatically
        greenLabel.adjustsFontSizeToFitWidth = true
        greenLabel.minimumScaleFactor = 20
        greenLabel.numberOfLines = 0
        greenLabel.textColor = .black
        greenLabel.font = greenLabel.font.withSize(15)
        greenLabel.textAlignment = .center
        greenLabel.backgroundColor = .blue
        view.insertSubview(lblFirstName, at: 10)
        view.insertSubview(greenLabel, at: 1)
    }

    // MARK: - Set up
    fileprivate func attributedStringLabel() {
        
        
        var attrString = try? AttributedString(markdown: "terms and condition")
        guard var attrString else { return }
        let range = attrString.range(of: "terms")
        let conditionRange = attrString.range(of: "condition")
        if let range , let conditionRange {
            attrString[range].foregroundColor = .green
            attrString[conditionRange].foregroundColor = .red
            attrString[conditionRange].font = UIFont.boldSystemFont(ofSize: 10)
            
        }
        let lblAttributedText = UILabel(frame: CGRect(x:100,y:500 ,width: 300,height:  50))
        lblAttributedText.attributedText = NSAttributedString(attrString)
        view.addSubview(lblAttributedText)
    }
    
    // MARK: - Set up
    fileprivate func setUpFirstNameLabel() {
        lblFirstName = UILabel()
        lblFirstName.frame = CGRect(x: 50, y:400, width: 300, height: 40)
        lblFirstName.text = Constants.String.addedProgrammatically
        lblFirstName.adjustsFontSizeToFitWidth = true
        lblFirstName.minimumScaleFactor = 20
        lblFirstName.numberOfLines = 0
        lblFirstName.textColor = .blue
        lblFirstName.font = lblFirstName.font.withSize(15)
        lblFirstName.textAlignment = .center
        lblFirstName.backgroundColor = .black
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(UILabelViewController.lblFirstNameClicked))
        lblFirstName.isUserInteractionEnabled = true
        lblFirstName.addGestureRecognizer(tap)
    }
    
}
