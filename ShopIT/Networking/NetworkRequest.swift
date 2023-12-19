//
//  NetworkRequest.swift
//  ShopIT
//
//  Created by Taha Turan on 19.12.2023.
//

import Foundation

protocol NetworkRequest {
    associatedtype ModelType: Codable
    var url: String { get }
    func perform(completion: @escaping(Result<ModelType, Error>) -> Void)
}
