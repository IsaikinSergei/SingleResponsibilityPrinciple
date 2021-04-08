//
//  AppGroup.swift
//  SingleResponsibilityPrinciple
//
//  Created by Sergei Isaikin on 09.04.2021.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let artistName: String
    let name: String
    let id: String
}
