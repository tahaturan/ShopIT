//
//  AddressView.swift
//  ShopIT
//
//  Created by Taha Turan on 27.12.2023.
//

import Foundation
import UIKit
import SnapKit

enum AddressType {
    case home
    case office
}

class AddressView: UIView {
    // MARK: - Properties

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Theme.Font.normalBoldFont
        label.textColor = .black
        return label
    }()

    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = Theme.Font.subTitleFont
        label.textColor = .gray
        return label
    }()

    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()

    private let selectButton: UIButton = {
        let button = UIButton()
        return button
    }()

    private let editIconButton: UIButton = {
        let button = UIButton()
        button.tintColor = .gray
        button.backgroundColor = .clear
        button.setImage(UIImage(systemName: "pencil.line"), for: .normal)
        return button
    }()
    let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()
    // MARK: - LifecCycle

    init(type: AddressType) {
        super.init(frame: .zero)
        setupUI()
        configureView(type: type)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(selectButton)
        containerView.addSubview(titleLabel)
        containerView.addSubview(phoneLabel)
        containerView.addSubview(addressLabel)
        containerView.addSubview(editIconButton)
        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(120)
        }
        
        selectButton.snp.makeConstraints { make in
            make.centerY.equalTo(containerView.snp.centerY)
            make.left.equalToSuperview().offset(20)
            
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalTo(selectButton.snp.right).offset(30)
        }
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalTo(titleLabel)
        }
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).offset(20)
            make.left.equalTo(titleLabel)
        }
        editIconButton.snp.makeConstraints { make in
            make.centerY.equalTo(selectButton)
            make.right.equalToSuperview().offset(-15)
            
        }
    }
    
    private func configureView(type: AddressType) {
        switch type {
        case .home:
            titleLabel.text = "Home"
            phoneLabel.text = "(256) 444 3312"
            addressLabel.text = "09 Aydin Soke"
            selectButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            selectButton.tintColor = .main
            containerView.backgroundColor = .white
            containerView.layer.shadowColor = UIColor.black.cgColor
            containerView.layer.shadowOpacity = 0.1
            containerView.layer.shadowOffset = CGSize(width: 0, height: 1)
            containerView.layer.shadowRadius = 5
            containerView.layer.cornerRadius = 7
        case .office:
            titleLabel.text = "Office"
            phoneLabel.text = "(232) 444 3312"
            addressLabel.text = " 20 Denizli Pamukkale"
            selectButton.setImage(UIImage(systemName: "circle"), for: .normal)
            selectButton.tintColor = .darkGray
            containerView.layer.borderWidth = 0.5
            containerView.layer.borderColor = UIColor.gray.cgColor
        }
    }
}
