//
//  ProfileViewLayout.swift
//  ShopIT
//
//  Created by Taha Turan on 26.12.2023.
//

import Foundation
import SnapKit

struct ProfileViewLayout {
    static func setupProfileLayout(on vc: ProfileViewController) {
        vc.view.addSubview(vc.profileBackrounImage)
        vc.view.addSubview(vc.profileImageView)
        vc.view.addSubview(vc.nameLabel)
        vc.view.addSubview(vc.emailLabel)
        vc.view.addSubview(vc.buttonStackView)
        vc.view.addSubview(vc.informationLabel)
        vc.view.addSubview(vc.informationView)
        
        vc.profileBackrounImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(220)
        }
        vc.profileImageView.snp.makeConstraints { make in
            make.top.equalTo(vc.view.safeAreaLayoutGuide).offset(10)
            make.centerX.equalTo(vc.view.snp.centerX)
            make.width.height.equalTo(Theme.Size.profileImageViewSize.width)
        }
        vc.nameLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.profileImageView.snp.bottom).offset(20)
            make.centerX.equalTo(vc.profileImageView)
        }
        vc.emailLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.nameLabel.snp.bottom).offset(10)
            make.centerX.equalTo(vc.profileImageView)
        }
        vc.buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(vc.emailLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(120)
        }
        vc.informationLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.buttonStackView.snp.bottom).offset(20)
            make.left.equalTo(vc.buttonStackView)
        }
        vc.informationView.snp.makeConstraints { make in
            make.top.equalTo(vc.informationLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(30)
            make.bottom.equalTo(vc.view.safeAreaLayoutGuide).offset(-40)
        }
    }
}
