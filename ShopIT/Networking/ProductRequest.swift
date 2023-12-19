//
//  ProductRequest.swift
//  ShopIT
//
//  Created by Taha Turan on 19.12.2023.
//

import Foundation

struct ProductRequest: NetworkRequest {
    typealias ModelType = Product
    var category: Category?
    var url: String {
        if let category = category {
            return APIEndpoint.productsByCategory(category).url
        }else{
            return APIEndpoint.products.url
        }
    }
    
    func perform(completion: @escaping (Result<Product, Error>) -> Void) {
        NetworkService().load(self, completion: completion)
    }
}
