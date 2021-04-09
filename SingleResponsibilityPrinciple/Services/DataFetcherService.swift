//
//  DataFetcherService.swift
//  SingleResponsibilityPrinciple
//
//  Created by Sergei Isaikin on 09.04.2021.
//

import Foundation

class DataFetcherService {
    
    var networkDataFetcher: DataFetcher
    var localDataFetcher: DataFetcher
    
    init(networkDataFetcher: DataFetcher = LocalDataFetcher(),localDataFetcher: DataFetcher = LocalDataFetcher() ) {
        self.networkDataFetcher = networkDataFetcher
        self.localDataFetcher = localDataFetcher
    }
    
    func fetchNewGames(completion: @escaping(AppGroup?) -> Void) {
        let urlNewGames = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/10/explicit.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlNewGames, response: completion)
    }
    
    func fetchFreeApp(completion: @escaping(AppGroup?) -> Void) {
        let urlFreeApp = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/10/explicit.json"
        networkDataFetcher.fetchGenericJSONData(urlString: urlFreeApp, response: completion)
        
    }
    
    func fetchEmails(completion: @escaping([Emails]?) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/posts/1/comments"
        networkDataFetcher.fetchGenericJSONData(urlString: urlString, response: completion)
    }
    
    func fetchLocalEmails(completion: @escaping([Emails]?) -> Void) {
        let localUrlString = "UsersAPI.txt"
        networkDataFetcher.fetchGenericJSONData(urlString: localUrlString, response: completion)
    }
    
}
