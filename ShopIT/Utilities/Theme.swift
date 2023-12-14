//
//  Theme.swift
//  ShopIT
//
//  Created by Taha Turan on 14.12.2023.
//

import Foundation
import UIKit

enum Theme {
    
    enum Font {
        static let titleFont = UIFont.systemFont(ofSize: 24, weight: .bold)
        static let subTitleFont = UIFont.systemFont(ofSize: 18, weight: .medium)
        static let primaryButtonFont = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
    
    enum Size {
        static let primaryButtonCornerRadius: CGFloat = 30
        static let primaryButtonHeight: CGFloat = 60
    }
}
