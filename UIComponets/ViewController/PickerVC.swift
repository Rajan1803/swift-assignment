//
//  PickerVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 25/05/23.
//

import UIKit

class PickerVC: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Set up
    private func setUpViews() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
}

// MARK: Extension for PickerVC
extension PickerVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        AnimalsModel.animalsData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return AnimalComponents(rawValue: component)?.getNumberOfRows() ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        switch AnimalComponents(rawValue: component) {
        case .animal: return Animal(rawValue: row)?.getAnimalName()
        case .breads: return AnimalsModel.breeds[row]
        case .none: return AnimalsModel.breeds[row]
        }
         
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(Animal(rawValue: row)?.getBreeds() ?? [])
        switch AnimalComponents(rawValue: component) {
        case .animal: AnimalsModel.breeds = Animal(rawValue: row)?.getBreeds() ?? []
        default: break
           
        }
        pickerView.reloadComponent(1)
    }
    
}
