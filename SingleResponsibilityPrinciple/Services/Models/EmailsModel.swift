//
//  EmailsModel.swift
//  SingleResponsibilityPrinciple
//
//  Created by Sergei Isaikin on 09.04.2021.
//

import Foundation

struct Emails: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
