//
//  CircularIconButton.swift
//  ShopIT
//
//  Created by Taha Turan on 17.12.2023.
//

import UIKit

class CircularIconButton: UIButton {
    private let normalColor: UIColor = .white
    private let highlightedColor: UIColor = .main.withAlphaComponent(0.4)
    init(icon: UIImage) {
        super.init(frame: .zero)
        setupButton(icon: icon)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton(icon: UIImage) {
        
        layer.cornerRadius = Theme.Size.socialButonSize.height / 2
        tintColor = .blue
        backgroundColor = .white
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 3
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowColor = UIColor.black.cgColor
        
        let image = UIImageView()
        image.image = icon
        addSubview(image)
        
        image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(Theme.Size.socialIconSize.width)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        backgroundColor = highlightedColor
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        backgroundColor = normalColor
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        backgroundColor = normalColor
    }
}
