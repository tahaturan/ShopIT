//
//  PrimaryButton.swift
//  ShopIT
//
//  Created by Taha Turan on 14.12.2023.
//

import Foundation
import UIKit

class PrimaryButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        setTitleColor(.white, for: .normal)
        backgroundColor = .main
        titleLabel?.font = Theme.Font.primaryButtonFont
        layer.cornerRadius = Theme.Size.primaryButtonCornerRadius
    }
}
