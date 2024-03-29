//
//  RealmService.swift
//  ShopIT
//
//  Created by Taha Turan on 24.12.2023.
//

import Foundation
import RealmSwift

class RealmService {
    private var realm: Realm
    
    init() {
        realm = try! Realm()
    }
    
    func addProductToCart(product: ProductElement)  {
        
        if let existingCartItem = realm.objects(CartItem.self).filter("productId == \(product.id)").first   {
            try! realm.write({
                existingCartItem.quantity += 1
            })
        } else {
            let cartItem = CartItem()
            cartItem.productId = product.id
            cartItem.name = product.title
            cartItem.quantity = 1
            cartItem.price = product.price
            cartItem.imageUrl = product.image
            
            try! realm.write({
                realm.add(cartItem)
            })
        }
    }
    
    func updateQuantity(for productId: Int, to newQuantity: Int)  {
        if let cartItem = realm.objects(CartItem.self).filter("productId == \(productId)").first {
                cartItem.quantity = newQuantity
        }
    }
    
    func addProductToFavorite(product: ProductElement)  {
        let favoriteItem = FavoriteItem()
        favoriteItem.name = product.title
        favoriteItem.imageUrl = product.image
        favoriteItem.productID = product.id
        favoriteItem.price = product.price
        
        try! realm.write({
            realm.add(favoriteItem)
        })
    }
    
    func getCartItems() -> [CartItem] {
        return Array(realm.objects(CartItem.self))
    }
    func getFavoriteItems() -> [FavoriteItem] {
        return Array(realm.objects(FavoriteItem.self))
    }
    
    func removeProdutcFromCart(cartItem: CartItem) {
        try! realm.write({
            realm.delete(cartItem)
        })
    }
    func removeProductFromFavorite(productId: Int)  {
        guard let favoriteItem = realm.objects(FavoriteItem.self).filter("productID == \(productId)").first else { return }
        try! realm.write({
            realm.delete(favoriteItem)
        })
    }
    private func convertCartToOrder(cartItems: [CartItem]) {
        try! realm.write({
            for cartItem in cartItems {
                let orderItem = OrderItem()
                orderItem.productId = cartItem.productId
                orderItem.name = cartItem.name
                orderItem.quantity = cartItem.quantity
                orderItem.imageUrl = cartItem.imageUrl
                orderItem.price = cartItem.price
                orderItem.date = Date()
                
                realm.add(orderItem)
                
                realm.delete(cartItem)
            }
        })
    }
    func checkoutCart() {
        let allCartItems = getCartItems()
        convertCartToOrder(cartItems: allCartItems)
    }
    func getOrderItems() -> [OrderItem] {
        return Array(realm.objects(OrderItem.self))
    }
}
