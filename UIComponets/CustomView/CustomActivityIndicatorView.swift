//
//  CustomActivityIndicatorView.swift
//  UIComponets
//
//  Created by Rajan Patel on 01/06/23.
//

import UIKit

class CustomActivityIndicatorView: UIView {
    
    // MARK: - IBOutlets
    @IBOutlet var superView: UIView!
    @IBOutlet var contentView: UIView!
    @IBOutlet var lblLoading: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // init with frame
    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init with frame")
        initWithFrame()
    }
    
    // init with coder
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("init with coder")
        setUpViews()
    }
    
    // MARK: - Set up init with frame
    private func initWithFrame() {
        contentView = UIView()
        contentView.frame = bounds
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = contentView.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .blue
        activityIndicator.startAnimating()
        lblLoading = UILabel()
        lblLoading.frame = CGRect(x: 0, y: activityIndicator.frame.maxY + 20, width:contentView.frame.width, height:30)
        lblLoading.textAlignment = .center
        lblLoading.text = "Loading"
        addSubview(contentView)
        contentView.addSubview(activityIndicator)
        contentView.addSubview(lblLoading)
    }
    
    // MARK: - Set up init with coder
    private func setUpViews() {
        Bundle.main.loadNibNamed("CustomActivityIndicatorView", owner: self, options: nil)
        activityIndicator.hidesWhenStopped = true
        superView.frame = bounds
        lblLoading.text = "Loading"
        addSubview(superView)
        activityIndicator.startAnimating()
    }
    
    // function to stop animating and stop displaing activity indicator view
    func stopAnimating() {
        activityIndicator.stopAnimating()
        superView.isHidden = true
    }
    
}
