//
//  UIPageControlVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 05/05/23.
//

import UIKit

class UIPageControlVC: BaseViewController {

    // MARK: - Variables And Declairations
    private var currentPage = 0
    // MARK: - IBOutlets
    @IBOutlet private var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPageControl()
    }
    
    // MARK: - Set up
    private func setUpPageControl() {
        pageControl.backgroundColor = .red
        pageControl.currentPage = 2
        pageControl.numberOfPages = 5
        pageControl.setIndicatorImage(UIImage(systemName: Constants.Img.squareAndArrowUp), forPage: 2)
        pageControl.setIndicatorImage(UIImage(systemName: Constants.Img.squareAndArrowUp), forPage: 3)
        updatePageControl()
    }
    // MARK: - IBActions
    @IBAction func btnNext(_ sender: Any) {
        if currentPage < pageControl.numberOfPages-1 {
            currentPage+=1
            updatePageControl()
        }
    }
    // MARK: - IBActions
    @IBAction func btnPrevious(_ sender: UIButton) {
        if currentPage > 0 {
            currentPage-=1
            updatePageControl()
        }
    }
    // MARK: - Actions
    private func updatePageControl() {
        pageControl.currentPage = currentPage
    }
}
