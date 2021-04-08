//
//  DataStore.swift
//  SingleResponsibilityPrinciple
//
//  Created by Sergei Isaikin on 08.04.2021.
//

import Foundation

class DataStore {
    
    // сохранение данных в кеш/базу данных
    func saveNameInCache(name: String) {
        print("Your name: \(name) is saved")
    }
    
    //получение данных из кеша/базы данных
    func getNameFromCache() -> String {
        return "some name"
    }
}
