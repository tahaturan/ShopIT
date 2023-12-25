//
//  CartItem.swift
//  ShopIT
//
//  Created by Taha Turan on 24.12.2023.
//

import Foundation
import RealmSwift

class CartItem: Object {
    @Persisted var productId: Int
    @Persisted var quantity: Int
    @Persisted var name: String
    @Persisted var price: Double
    @Persisted var imageUrl: String
}
