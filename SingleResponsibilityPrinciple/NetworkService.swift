//
//  NetworkService.swift
//  SingleResponsibilityPrinciple
//
//  Created by Sergei Isaikin on 08.04.2021.
//

import Foundation

class NetworkService {
    
    func dataFetcher(urlString: String) {
        request(urlString: urlString) { (data, error) in
            let decoder = JSONDecoder()
            guard let data = data else { return }
            guard let response = try? decoder.decode([Emails].self, from: data) else { return }
            print(response)
        }
    }
    
    func request(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
        .resume()
    }
}
