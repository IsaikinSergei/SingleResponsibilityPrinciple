//
//  NetworkDataFetcher.swift
//  SingleResponsibilityPrinciple
//
//  Created by Sergei Isaikin on 09.04.2021.
//

import Foundation

class NetworkDataFetcher {
    
    var networkService = NetworkService()
    
    init(networkService: NetworkService = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchFreeApp(urlString: String, completion: @escaping([AppGroup]?) -> Void) {
        networkService.request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            guard let response = try? decoder.decode([AppGroup].self, from: data) else { return }
            completion(response)
        }
    }
    
    // декодируем полученные JSON данные в конкретную модель данных
    
    func fetchEmails(urlString: String, completion: @escaping([Emails]?) -> Void) {
        networkService.request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            guard let response = try? decoder.decode([Emails].self, from: data) else { return }
            completion(response)
        }
    }
}
