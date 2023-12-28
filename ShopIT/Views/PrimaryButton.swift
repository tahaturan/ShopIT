//
//  PrimaryButton.swift
//  ShopIT
//
//  Created by Taha Turan on 14.12.2023.
//

import Foundation
import UIKit

class PrimaryButton: UIButton {
    private let normalColor: UIColor = .main
    private let highlightedColor: UIColor = .main.withAlphaComponent(0.6)
    private var isBack: Bool = false
    init(title: String, isBack: Bool = false) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        self.isBack = isBack
        setupButton(isBack: isBack)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton(isBack: Bool) {
        setTitleColor(isBack ? .main : .white, for: .normal)
        backgroundColor = isBack ? .main.withAlphaComponent(0.2) : .main
        titleLabel?.font = Theme.Font.primaryButtonFont
        layer.cornerRadius = Theme.Size.primaryButtonCornerRadius
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        backgroundColor = highlightedColor
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        backgroundColor = isBack ?  normalColor.withAlphaComponent(0.2) : normalColor
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        backgroundColor = isBack ?  normalColor.withAlphaComponent(0.2) : normalColor
    }
    
}
