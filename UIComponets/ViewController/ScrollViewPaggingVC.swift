//
//  ScrollViewPaggingVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 24/05/23.
//

import UIKit

class ScrollViewPaggingVC: UIViewController {

    private enum Constant {
            static let numberOfPages = 20
            static let padding: CGFloat = 10
            static let innerViewHeightOffset: CGFloat = 150
        }
   
    // MARK: - IBOutlets
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - IBActions
    @IBAction func pageControlValueChanged(_ sender: UIPageControl) {
        let offSet = CGFloat(sender.currentPage) * scrollView.frame.width
        scrollView.setContentOffset(CGPoint(x: offSet, y: 0), animated: true)
    }
    
    // MARK: - Set up
    func setUpViews() {
        scrollView.delegate = self
        pageControl.numberOfPages = Constant.numberOfPages
        scrollView.isPagingEnabled = true
        for i in 1...Constant.numberOfPages {
            let innerview = UIView(frame: CGRect(x: (CGFloat(Int(self.view.frame.width)*(i-1)) + Constant.padding), y: Constant.padding, width: view.frame.width - Constant.padding*2, height: view.frame.height - Constant.innerViewHeightOffset))
            scrollView.addSubview(innerview)
            innerview.backgroundColor = (i % 2 == 0) ? .red : .blue
            scrollView.backgroundColor = .purple
        }
        scrollView.contentSize = CGSize(width: view.frame.width*CGFloat(Constant.numberOfPages), height: view.frame.height - Constant.innerViewHeightOffset )
        print(scrollView.contentOffset)
    }
    
}

// MARK: Extension of ScrollViewPaggingVC for UIScrollViewDelegate
extension ScrollViewPaggingVC: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
                pageControl.currentPage = pageIndex
    }
    
}
