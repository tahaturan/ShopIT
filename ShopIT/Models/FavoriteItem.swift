//
//  FavoriteItem.swift
//  ShopIT
//
//  Created by Taha Turan on 24.12.2023.
//

import Foundation
import RealmSwift

class FavoriteItem: Object {
    @Persisted var productID: Int
    @Persisted var name: String
    @Persisted var imageUrl: String
    @Persisted var price: Double
}
