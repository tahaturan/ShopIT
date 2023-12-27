//
//  ProfileInfoView.swift
//  ShopIT
//
//  Created by Taha Turan on 26.12.2023.
//

import Foundation
import UIKit
import SnapKit

fileprivate enum InfoLabelType {
    case text
    case value
}
class ProfileInfoView: UIView {
   private lazy var nameLabel: UILabel = createLabel(text: "Name:", type: .text)
   private lazy var nameValue: UILabel = createLabel(text: "Taha Turan", type: .value)
   private lazy var emailLabel = createLabel(text: "Email:", type: .text)
   private lazy var emailValue = createLabel(text: "taha@gmail.com", type: .value)
   private lazy var locationLabel = createLabel(text: "Location:", type: .text)
   private lazy var locationValue = createLabel(text: "Aydin", type: .value)
   private lazy var zipCodeLabel = createLabel(text: "Zip Code:", type: .text)
   private lazy var zipCodeValue = createLabel(text: "09200", type: .value)
   private lazy var numberLabel = createLabel(text: "Phone Number:", type: .text)
   private lazy var numberValue = createLabel(text: "(+90) 545 247 1997", type: .value)
    
    init() {
        super.init(frame: .zero)
        setupView()
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(nameLabel)
        addSubview(nameValue)
        addSubview(emailLabel)
        addSubview(emailValue)
        addSubview(locationLabel)
        addSubview(locationValue)
        addSubview(zipCodeLabel)
        addSubview(zipCodeValue)
        addSubview(numberLabel)
        addSubview(numberValue)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(10)
        }
        nameValue.snp.makeConstraints { make in
            make.top.equalTo(nameLabel)
            make.right.equalToSuperview().offset(-10)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(15)
            make.left.equalTo(nameLabel)
        }
        emailValue.snp.makeConstraints { make in
            make.top.equalTo(emailLabel)
            make.right.equalTo(nameValue)
        }
        locationLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(15)
            make.left.equalTo(nameLabel)
        }
        locationValue.snp.makeConstraints { make in
            make.top.equalTo(locationLabel)
            make.right.equalTo(nameValue)
        }
        zipCodeLabel.snp.makeConstraints { make in
            make.top.equalTo(locationLabel.snp.bottom).offset(15)
            make.left.equalTo(nameLabel)
        }
        zipCodeValue.snp.makeConstraints { make in
            make.top.equalTo(zipCodeLabel)
            make.right.equalTo(nameValue)
        }
        numberLabel.snp.makeConstraints { make in
            make.top.equalTo(zipCodeLabel.snp.bottom).offset(15)
            make.left.equalTo(nameLabel)
        }
        numberValue.snp.makeConstraints { make in
            make.top.equalTo(numberLabel)
            make.right.equalTo(nameValue)
        }
    }
}
//MARK: - Factory Methods
extension ProfileInfoView {
    private func createLabel(text: String, type: InfoLabelType) -> UILabel {
        let label = UILabel()
        label.text = text
        switch type {
        case .text:
            label.font = UIFont.systemFont(ofSize: 14, weight: .light)
            label.textColor = .gray
        case .value:
            label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            label.textColor = .black
        }
        return label
    }
}
