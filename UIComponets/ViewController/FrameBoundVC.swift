//
//  FrameBoundVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 27/04/23.
//

import UIKit

class FrameBoundVC: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var blue: UIButton!
    override func viewDidLoad() {
        printDetails()
    }
   
    // MARK: - Life cycle
    @IBAction func touchUpInsode(_ sender: Any) {
        print(#function)
    }
    @IBAction func touchUpOutside(_ sender: Any) {
        print(#function)
    }
    @IBAction func valueChanged(_ sender: Any) {
        print(#function)
    }
    
    @IBAction func touchDragOutside(_ sender: Any) {
        print(#function)
    }
    @IBAction func touchDragInside(_ sender: Any) {
        print(#function)
    }
    @IBAction func touchDragExit(_ sender: Any) {
        print(#function)
    }
    @IBAction func didEndOnExit(_ sender: Any) {
        print(#function)
    }
    
    @IBAction func editingChanged(_ sender: Any) {
        print(#function)
    }
    @IBAction func primeryActionTriggered(_ sender: Any) {
        print(#function)
    }
    @IBAction func touchDown(_ sender: Any) {
        print(#function)
    }
    @IBAction func touchDownRepeat(_ sender: Any) {
        print(#function)
    }
    
    @IBAction func touchDragEnter(_ sender: Any) {
        print(#function)
    }
    
    // MARK: - FUNCTION
    private func printDetails() {
        print("frame: x: \(blue.frame.origin.x)  y: \(blue.frame.origin.x) height: \(blue.frame.height)  width: \(blue.frame.width)")
        print("bounds: x: \(blue.bounds.origin.x)  y: \(blue.frame.origin.y) height: \(blue.bounds.height) width: \(blue.bounds.width)")
    }
}
