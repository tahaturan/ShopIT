//
//  CredidCartModel.swift
//  ShopIT
//
//  Created by Taha Turan on 31.12.2023.
//

import Foundation
import UIKit
struct CreditCartModel {
    var cardNumber: String
    var cardHolderName: String
    var expirationDate: String
    var cardType: CardType
    
    static let dummyVisaCard = CreditCartModel(cardNumber: "1234 1215 2145 1254", cardHolderName: "Taha Turan", expirationDate: "22/05/2027", cardType: .visa)
    static let dummyMasterCard = CreditCartModel(cardNumber: "4756 4546 1256 7788", cardHolderName: "Taha Turan", expirationDate: "20/01/2028", cardType: .masterCard)
    static let dummyPaypalCard = CreditCartModel(cardNumber: "9854 2123 7777 3564", cardHolderName: "Taha Turan", expirationDate: "24/08/2025", cardType: .paypal)
    
    static let dummyCartList: [CreditCartModel] = [dummyVisaCard, dummyMasterCard, dummyPaypalCard]
    
}

enum CardType {
    case visa
    case masterCard
    case paypal
}
extension CardType {
    func loadCartType() -> String {
        switch self {
        case .visa:
            return "VISA"
        case .masterCard:
            return "MasterCard"
        case .paypal:
            return "PayPal"
        }
    }
    func gradiendColorList() -> [CGColor] {
        switch self {
        case .visa:
            return [UIColor(red: 0.06, green: 0.13, blue: 0.15, alpha: 1.00).cgColor,
                    UIColor(red: 0.13, green: 0.23, blue: 0.26, alpha: 1.00).cgColor,
                    UIColor(red: 0.17, green: 0.33, blue: 0.39, alpha: 1.00).cgColor]
        case .masterCard:
            return [UIColor(red: 0.54, green: 0.14, blue: 0.53, alpha: 1.00).cgColor,
                    UIColor(red: 0.91, green: 0.25, blue: 0.34, alpha: 1.00).cgColor,
                    UIColor(red: 0.17, green: 0.33, blue: 0.39, alpha: 1.00).cgColor]
        case .paypal:
            return [UIColor(red: 0.07, green: 0.76, blue: 0.91, alpha: 1.00).cgColor,
                    UIColor(red: 0.77, green: 0.44, blue: 0.93, alpha: 1.00).cgColor,
                    UIColor(red: 0.17, green: 0.33, blue: 0.39, alpha: 1.00).cgColor]
        }
    }
}
