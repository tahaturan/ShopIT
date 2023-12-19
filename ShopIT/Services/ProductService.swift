//
//  ProductService.swift
//  ShopIT
//
//  Created by Taha Turan on 19.12.2023.
//

import Foundation
import Alamofire

class ProductService {
    static let shared = ProductService()
    
    private init() {}
    
    private let baseURL = "https://fakestoreapi.com/products"
    
    func fetchProducts(completion: @escaping (Result<Product, Error>) -> Void) {
        AF.request(baseURL, method: .get).responseDecodable(of: Product.self) { response in
            switch response.result {
            case .success(let products):
                completion(.success(products))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
