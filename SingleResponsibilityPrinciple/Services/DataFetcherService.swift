//
//  DataFetcherService.swift
//  SingleResponsibilityPrinciple
//
//  Created by Sergei Isaikin on 09.04.2021.
//

import Foundation

class DataFetcherService {
    
    var dataFetcher: DataFetcher
    
    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }
    
    func fetchNewGames(completion: @escaping(AppGroup?) -> Void) {
        let urlNewGames = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/10/explicit.json"
        dataFetcher.fetchGenericJSONData(urlString: urlNewGames, response: completion)
    }
    
    func fetchFreeApp(completion: @escaping(AppGroup?) -> Void) {
        let urlFreeApp = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/10/explicit.json"
        dataFetcher.fetchGenericJSONData(urlString: urlFreeApp, response: completion)
        
    }
    
    func fetchEmails(completion: @escaping([Emails]?) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/posts/1/comments"
        dataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }
    
    
    
}
