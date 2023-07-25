//
//  SourcesDetailViewModel.swift
//  News
//
//  Created by Rajan Patel on 17/07/23.
//

import Foundation

class SourcesViewModel {
    
    // MARK: - Variables And Declarations
    var onSucces = Dynamic<SourcesDetail?>(nil)
    var onApiError = Dynamic<Error?>(nil)
    
     // MARK: - Function to get sources data
    func getSourcesData() {
        ApiManager.shared.getSources(complisionHadler: {[weak self] result in
            guard let self else {return }
            switch result {
            case .success(let sourceData):
                self.onSucces.value = sourceData
            case .failure(let error):
                self.onApiError.value = error
            }
        })
    }
    
}
