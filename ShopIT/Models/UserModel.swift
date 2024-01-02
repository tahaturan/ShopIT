//
//  UserModel.swift
//  ShopIT
//
//  Created by Taha Turan on 2.01.2024.
//

import Foundation

struct UserModel {
    let name: String
    let email: String
    let city: String
    let zipCode: String
    let phoneNumber: String
    let jop: String
    
    static let dummyUser = UserModel(name: "Taha Turan", email: "taha@gmail.com", city: "Aydin", zipCode: "09200", phoneNumber: "(+90) 549 447 1997", jop: "iOS Developer")
}
