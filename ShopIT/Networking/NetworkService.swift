//
//  NetworkService.swift
//  ShopIT
//
//  Created by Taha Turan on 19.12.2023.
//

import Foundation
import Alamofire

class NetworkService<Request: NetworkRequest> {
    func load(_ request: Request, completion: @escaping (Result<Request.ModelType, Error>) -> Void) {
        AF.request(request.url, method: .get).responseDecodable(of: Request.ModelType.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
