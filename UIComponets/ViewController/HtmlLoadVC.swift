//
//  HtmlLoadVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 31/05/23.
//

import UIKit
import MapKit
import WebKit

class HtmlLoadVC: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        webView.loadHTMLString(HTMLConstant.htmlString, baseURL: nil)
        searchBar.delegate = self
        let btnSearch = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        btnSearch.setTitle("search", for: .normal)
        searchBar.searchTextField.rightView = btnSearch
        searchBar.searchTextField.rightViewMode = .always
    }
    
}

// MARK: Extension of HtmlLoadVC
extension HtmlLoadVC: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print(#function)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print(#function)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchBar.text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
    }
    
}
