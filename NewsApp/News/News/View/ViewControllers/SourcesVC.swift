//
//  SourcesVC.swift
//  News
//
//  Created by Rajan Patel on 14/07/23.
//

import UIKit

class SourcesVC: UIViewController {

    // MARK: - Variables And Declarations
    var sourceList = [SourceDetail]()
    let sourcesViewModel = SourcesViewModel()
    
    // MARK: - IBOutlets
    @IBOutlet weak var tblviewSources: UITableView!
    
    // MARK: - Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
     // MARK: - Set up
    private func initViews() {
        tblviewSources.delegate = self
        tblviewSources.dataSource = self
        tblviewSources.register(UINib(nibName: R.nib.sourcesCell.name, bundle: nil), forCellReuseIdentifier: R.nib.sourcesCell.name)
        bindViewModel()
        sourcesViewModel.getSourcesData()
    }
    
     // MARK: - Set up
    private func bindViewModel() {
        sourcesViewModel.onSucces.bind({[weak self] sourcesDetail in
            guard let self else {return }
            guard let sources = sourcesDetail?.sources else {return}
            self.sourceList.append(contentsOf: sources)
            self.tblviewSources.reloadData()
        })
        sourcesViewModel.onApiError.bind({error in
            print(error as Any)
        })
    }
}

 // MARK: - Extension for UITableViewDelegate, UITableViewDataSource 
extension SourcesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblviewSources.dequeueReusableCell(withIdentifier: R.nib.sourcesCell, for: indexPath) else { return UITableViewCell() }
        cell.setData(source: sourceList[indexPath.row])
        return cell
    }
    
}
