//
//  CustomCategoryButton.swift
//  ShopIT
//
//  Created by Taha Turan on 19.12.2023.
//

import UIKit
import SnapKit


class CustomCategoryButton: UIButton {
    private let normalColor: UIColor = .white
    private let highlightedColor: UIColor = .main.withAlphaComponent(0.4)

    init(icon: UIImage, text: String) {
        super.init(frame: .zero)
        setupButton(icon: icon, text: text)
        layer.cornerRadius = 10
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton(icon: UIImage, text: String) {
        let imageView = UIImageView()
        imageView.image = icon
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
        
        let titleLabel = UILabel()
        titleLabel.text = text
        titleLabel.textAlignment = .center
        titleLabel.textColor = .gray
        addSubview(titleLabel)
        
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.left.right.equalTo(imageView)
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
