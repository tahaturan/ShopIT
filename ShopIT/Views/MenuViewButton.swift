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
        case .wallets:
            setTitle("Wallets", for: .normal)
            setImage(UIImage(systemName: "creditcard.fill"), for: .normal)
        case .orders:
            setTitle("My Orders", for: .normal)
            setImage(UIImage(systemName: "bag.fill"), for: .normal)

        case .aboutUs:
            setTitle("About us", for: .normal)
            setImage(UIImage(systemName: "doc.text.fill"), for: .normal)

        case .privacyPolicy:
            setTitle("Privacy policy", for: .normal)
            setImage(UIImage(systemName: "lock.doc.fill"), for: .normal)

        case .settings:
            setTitle("Settings", for: .normal)
            setImage(UIImage(systemName: "gearshape.circle.fill"), for: .normal)
        case .logOut:
            setTitle("Log out", for: .normal)
            setImage(UIImage(systemName: "rectangle.portrait.and.arrow.forward.fill"), for: .normal)
        }
    }
}
