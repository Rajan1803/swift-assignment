//
//  NewsViewModel.swift
//  News
//
//  Created by Rajan Patel on 15/07/23.
//

import Foundation

class NewsViewModel {
    
    // MARK: - Variables And Declarations
    var onSucces = Dynamic<NewsDetail?>(nil)
    var onApiError = Dynamic<Error?>(nil)
    
     // MARK: - Function to get news data
    func getNewsData(parameters: [String: Any]) {
        ApiManager.shared.getNews(parameters: parameters, complisionHadler: {[weak self] result in
            guard let self else {return }
            switch result {
            case .success(let newsData):
                self.onSucces.value = newsData
            case .failure(let error):
                self.onApiError.value = error
            }
        })
    }
    
    func addArticles(articles: [Article]?) {
        guard let articles else {return }
        Article.listOfAticles = [Article]()
        Article.listOfAticles.append(contentsOf: articles)
    }
    
}
