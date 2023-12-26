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
        static let normalBoldFont = UIFont.systemFont(ofSize: 18, weight: .semibold)
    }
    
    enum Size {
        static let primaryButtonCornerRadius: CGFloat = 30
        static let primaryButtonHeight: CGFloat = 60
        static let defaultTextfieldCornerRadius: CGFloat = 10
        static let defaultTextFieldHeight: CGFloat = 50
        static let socialButonSize: CGSize = CGSize(width: 70, height: 70)
        static let socialIconSize: CGSize = CGSize(width: 30, height: 30)
        static let tabbarIconSize: CGSize = CGSize(width: 24.0, height: 24.0)
        static let profileImageViewSize = CGSize(width: 150, height: 150)
    }
    
    enum IconName {
        static let email: String = "envelope"
        static let person: String = "person"
        static let password: String = "lock"
    }
}
