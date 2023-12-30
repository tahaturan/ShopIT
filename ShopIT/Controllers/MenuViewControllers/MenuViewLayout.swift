//
//  MenuViewLayout.swift
//  ShopIT
//
//  Created by Taha Turan on 28.12.2023.
//

import Foundation
import UIKit
import SnapKit

struct MenuViewLayout {
    static func  setupLayout(in vc: MenuViewController) {
        vc.view.addSubview(vc.profileImageView)
        vc.view.addSubview(vc.nameLabel)
        vc.view.addSubview(vc.jopLabel)
        vc.view.addSubview(vc.profileButton)
        vc.view.addSubview(vc.buttonStackView)
        vc.view.addSubview(vc.logOutButton)
        vc.view.addSubview(vc.logoImageView)
        
        vc.profileImageView.snp.makeConstraints { make in
            make.top.equalTo(vc.view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(30)
            make.width.height.equalTo(Theme.Size.profileImageViewSize.width / 2)
        }
        vc.nameLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.view.safeAreaLayoutGuide).offset(10)
            make.left.equalTo(vc.profileImageView.snp.right).offset(10)
        }
        vc.jopLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.nameLabel.snp.bottom).offset(6)
            make.left.equalTo(vc.nameLabel)
        }
        vc.profileButton.snp.makeConstraints { make in
            make.top.equalTo(vc.nameLabel).offset(12)
            make.left.equalTo(vc.nameLabel.snp.right).offset(40)
            make.width.height.equalTo(24)
        }
        vc.buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(vc.profileImageView.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(20)
            make.width.equalTo(200)
            make.height.equalTo(vc.view.frame.height * 0.45)
        }
        vc.logOutButton.snp.makeConstraints { make in
            make.top.equalTo(vc.buttonStackView.snp.bottom).offset(50)
            make.left.equalTo(vc.buttonStackView)
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        
        vc.logoImageView.snp.makeConstraints { make in
            make.bottom.equalTo(vc.view.safeAreaLayoutGuide).offset(-20)
            make.width.height.equalTo(120)
        }
    }
}
