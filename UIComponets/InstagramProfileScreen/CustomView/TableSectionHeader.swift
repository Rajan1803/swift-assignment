//
//  TableSectionHeader.swift
//  UIComponets
//
//  Created by Rajan Patel on 02/06/23.
//

import UIKit

protocol SegmentControl: AnyObject {
    
    func segmentValueChange(value: Int)
    
}

class TableSectionHeader: UIView {
    
    // MARK: - Life cycle Methods
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var segmentControl: UISegmentedControl!
    
    // MARK: - Variables And Declarations
    weak var delegate: SegmentControl?
    
    //FUNCTION will return TableSectionHeader
    class func initWithNib() -> TableSectionHeader {
        guard let header = UINib(nibName: Constants.Nib.tableSectionHeader, bundle: nil).instantiate(withOwner: nil)[0] as? TableSectionHeader else { return TableSectionHeader() }
        header.contentView.backgroundColor = .white
        return header
    }
    
    // MARK: - IBActions
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        delegate?.segmentValueChange(value: sender.selectedSegmentIndex)
    }
    
}
