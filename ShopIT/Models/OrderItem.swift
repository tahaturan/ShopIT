//
//  OrderItem.swift
//  ShopIT
//
//  Created by Taha Turan on 2.01.2024.
//

import Foundation
import RealmSwift

class OrderItem: Object {
    @Persisted var productId: Int
    @Persisted var quantity: Int
    @Persisted var name: String
    @Persisted var price: Double
    @Persisted var imageUrl: String
    @Persisted var date: Date
}
