//
//  MenuViewButton.swift
//  ShopIT
//
//  Created by Taha Turan on 30.12.2023.
//

import Foundation
import UIKit
enum ButtonItemType {
    case favorite
    case wallets
    case orders
    case aboutUs
    case privacyPolicy
    case settings
    case logOut
    case emailSupport
    case faq
    case privacyStetesment
    case notification
    case update
}

class MenuViewButton: UIButton {
    init(type: ButtonItemType) {
        super.init(frame: .zero)
        setupButton()
        configureButton(type: type)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupButton() {
        tintColor = .main
        var configuration = UIButton.Configuration.plain()
        configuration.imagePadding = 10
        self.configuration = configuration
        contentHorizontalAlignment = .left
        setTitleColor(.gray, for: .normal)
    }

    private func configureButton(type: ButtonItemType) {
        switch type {
        case .favorite:
            setTitle("My Favorites", for: .normal)
            setImage(UIImage(systemName: "heart.square.fill"), for: .normal)
            self.tag = 1
        case .wallets:
            setTitle("Wallets", for: .normal)
            setImage(UIImage(systemName: "creditcard.fill"), for: .normal)
            self.tag = 2
        case .orders:
            setTitle("My Orders", for: .normal)
            setImage(UIImage(systemName: "bag.fill"), for: .normal)
            self.tag = 3
        case .aboutUs:
            setTitle("About us", for: .normal)
            setImage(UIImage(systemName: "doc.text.fill"), for: .normal)
            self.tag = 4
        case .privacyPolicy:
            setTitle("Privacy policy", for: .normal)
            setImage(UIImage(systemName: "lock.doc.fill"), for: .normal)
            self.tag = 5
        case .settings:
            setTitle("Settings", for: .normal)
            setImage(UIImage(systemName: "gearshape.circle.fill"), for: .normal)
            self.tag = 6
        case .logOut:
            setTitle("Log out", for: .normal)
            setImage(UIImage(systemName: "rectangle.portrait.and.arrow.forward.fill"), for: .normal)
            self.tag = 7
        case .emailSupport:
            setTitle("Email Support", for: .normal)
            setImage(UIImage(systemName: "envelope.fill"), for: .normal)
        case .faq:
            setTitle("FAQ", for: .normal)
            setImage(UIImage(systemName: "questionmark.app.fill"), for: .normal)
        case .privacyStetesment:
            setTitle("Privacy Stetesment", for: .normal)
            setImage(UIImage(systemName: "lock.doc.fill"), for: .normal)
        case .notification:
            setTitle("Notification", for: .normal)
            setImage(UIImage(systemName: "bell.fill"), for: .normal)
        case .update:
            setTitle("Update", for: .normal)
            setImage(UIImage(systemName: "arrow.triangle.2.circlepath.circle.fill"), for: .normal)
            
        }
    }
}
