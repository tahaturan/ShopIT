//
//  ProfileViewButton.swift
//  ShopIT
//
//  Created by Taha Turan on 26.12.2023.
//

import Foundation
import UIKit
import SnapKit

enum ViewType {
    case progressOrder
    case promocodes
    case reviewes
}

class ProfileViewButton: UIView {
    let containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 0.5
        view.layer.cornerRadius = 10
        return view
    }()
    private let iconButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.contentMode = .scaleAspectFit
        button.backgroundColor = .main.withAlphaComponent(0.1)
        return button
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .gray
        return label
    }()
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = Theme.Font.normalBoldFont
        label.textColor = .black
        return label
    }()
    init(type: ViewType) {
        super.init(frame: .zero)
        setupView()
        configureView(type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(containerView)
        containerView.addSubview(iconButton)
        containerView.addSubview(titleLabel)
        containerView.addSubview(valueLabel)
        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.left.right.equalToSuperview()
            make.height.equalTo(120)
        }
        iconButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.centerX.equalTo(containerView.snp.centerX)
            make.width.height.equalTo(50)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconButton.snp.bottom).offset(10)
            make.centerX.equalTo(iconButton)
        }
        valueLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.centerX.equalTo(iconButton)
        }
    }
    
    private func configureView(type: ViewType) {
        switch type {
        case .progressOrder:
            iconButton.setImage(.progressOrder, for: .normal)
            titleLabel.text = "Progress order"
            valueLabel.text = "10+"
        case .promocodes:
            iconButton.setImage(.coupon, for: .normal)
            titleLabel.text = "Promocodes"
            valueLabel.text = "5"
        case .reviewes:
            iconButton.setImage(.rating, for: .normal)
            titleLabel.text = "Reviewes"
            valueLabel.text = "4.5K"
        }
    }
}
