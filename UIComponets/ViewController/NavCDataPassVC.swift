//
//  NavCDataPassVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 29/05/23.
//

import UIKit

class NavCDataPassVC: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var txfInput: UITextField!
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpViews()
    }

    // MARK: - Set up
    func setUpViews() {
        navigationItem.leftBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil), UIBarButtonItem(barButtonSystemItem: .cancel, target: .none, action: .none)]
        navigationItem.backButtonTitle = "hheo"
        navigationItem.backButtonDisplayMode = .default
        navigationItem.centerItemGroups = [UIBarButtonItemGroup(barButtonItems: [UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil),UIBarButtonItem(barButtonSystemItem: .close, target: self, action: nil)], representativeItem: nil),UIBarButtonItemGroup(barButtonItems: [UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)], representativeItem: nil),UIBarButtonItemGroup(barButtonItems: [UIBarButtonItem(barButtonSystemItem: .done, target: self, action: nil)], representativeItem: nil)]
        navigationItem.prompt = "prompt"
        navigationItem.title = "Home"
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: Constants.Img.faceBookLogo), for: .default)
        navigationController?.navigationBar.tintColor = .cyan
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backIndicatorImage = UIImage(named: Constants.Img.bookmark)
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: Constants.Img.faceBookLogo)
        
        //Commneted Code contains other properties for navigation bar
        
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Go Back", style: .plain, target: nil, action: nil)
        
        
//        navigationItem.centerItemGroups = [ UIBarButtonItemGroup(barButtonItems: [UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil)], representativeItem: UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil)) ]
        
        
//        navigationItem.leadingItemGroups =  [UIBarButtonItemGroup(barButtonItems: [UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: nil),UIBarButtonItem(barButtonSystemItem: .close, target: self, action: nil)], representativeItem: nil),UIBarButtonItemGroup(barButtonItems: [UIBarButtonItem(barButtonSystemItem: .action, target: self, action: nil)], representativeItem: nil),UIBarButtonItemGroup(barButtonItems: [UIBarButtonItem(barButtonSystemItem: .done, target: self, action: nil)], representativeItem: nil)]
        
//        navigationItem.style = UINavigationItem.ItemStyle.
       
//        navigationController?.navigationBar.backgroundColor = .white
       
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.]
//        navigationController?.navigationBar.setBackgroundImage(UIImage(named: Constants.Img.FaceBookLogo), for: .default)
       
//        let appearance = UINavigationBarAppearance()
//        appearance.titleTextAttributes = [NSAttributedString.Key.]
//        navigationController?.navigationBar.compactAppearance
//        navigationController?.navigationBar.backIndicatorImage = UIImage(named: Constants.Img.HomeNav)
//        navigationController?.navigationBar.
//        navigationItem.titleView = UIImageView(image: UIImage(named: Constants.Img.HomeNav))
//        let appearance = UINavigationBarAppearance()
//        appearance.
//        navigationController?.navigationBar.compactAppearance
        
    }
    
    // MARK: - IBActions
    @IBAction func btnNextClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "dataSegue", sender: self)
    }
    
    // datapassing using segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "dataSegue" else { return }
        guard let vc = segue.destination as? SegueDataPassVC else { return }
        vc.inputText = txfInput.text
        
    }
    
}
