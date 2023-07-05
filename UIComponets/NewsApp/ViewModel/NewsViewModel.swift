//
//  NewsViewModel.swift
//  UIComponets
//
//  Created by Rajan Patel on 30/06/23.
//

import Foundation
import Reachability

class NewsViewModel {
    
    // MARK: - Variables And Declarations
    var onSucces = Dynamic<News?>(nil)
    var onApiError = Dynamic<Error?>(nil)
    
    // function to get news data from server
    func getNewsData( parameters: [String: Any]?) {
        APIManager.shared.getDataAF(url: RequestItemsType.getNews.url,parameters: parameters, complisionHadler: { (result: Result<News ,Error>) in
            switch result {
            case .success(let data):
                self.onSucces.value = data
            case .failure(let error):
                self.onApiError.value = error
            }
        })
        
    }
    
}
