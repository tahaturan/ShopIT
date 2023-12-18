//
//  CategoryListButtons.swift
//  ShopIT
//
//  Created by Taha Turan on 19.12.2023.
//

import UIKit

class CategoryListButtons: UIView {
    private let dressButton: CustomCategoryButton = CustomCategoryButton(icon: .dress, text: "Dress")
    private let shirtButton: CustomCategoryButton = CustomCategoryButton(icon: .shirt, text: "Shirt")
    private let pantsButton: CustomCategoryButton = CustomCategoryButton(icon: .pants, text: "Pants")
    private let tshirtButton: CustomCategoryButton = CustomCategoryButton(icon: .tshirt, text: "Tshirt")
    private var stackView: UIStackView!

    init() {
        super.init(frame: .zero)
        setupButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupButtons() {
        stackView = UIStackView(arrangedSubviews: [dressButton, shirtButton, pantsButton, tshirtButton])
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}
