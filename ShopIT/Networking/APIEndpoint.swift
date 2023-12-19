//
//  APIEndpoint.swift
//  ShopIT
//
//  Created by Taha Turan on 19.12.2023.
//

import Foundation

enum APIEndpoint {
    case products
    case productsByCategory(Category)
    
    var url: String {
        let baseURL = "https://fakestoreapi.com/products"
        switch self {
        case .products:
            return baseURL
        case .productsByCategory(let category):
            return "\(baseURL)/category/\(category.rawValue)"
        }
    }
}
