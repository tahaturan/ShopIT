//
//  SeetingsViewLayout.swift
//  ShopIT
//
//  Created by Taha Turan on 2.01.2024.
//

import Foundation

struct SettingsViewLayout {
    static func setupLayout(in vc: SettingsViewController) {
        vc.view.addSubview(vc.titleLabel)
        vc.view.addSubview(vc.emailSupportButton)
        vc.view.addSubview(vc.faqButton)
        vc.view.addSubview(vc.privacyButton)
        vc.view.addSubview(vc.noticationButton)
        vc.view.addSubview(vc.updateButton)
        vc.view.addSubview(vc.notificationSwitch)
        vc.view.addSubview(vc.updateSwitch)
        
        vc.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.view.safeAreaLayoutGuide).offset(10)
            make.centerX.equalTo(vc.view.snp.centerX)
        }
        vc.emailSupportButton.snp.makeConstraints { make in
            make.top.equalTo(vc.titleLabel.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(10)
        }
        vc.faqButton.snp.makeConstraints { make in
            make.top.equalTo(vc.emailSupportButton.snp.bottom).offset(20)
            make.left.equalTo(vc.emailSupportButton)
        }
        vc.privacyButton.snp.makeConstraints { make in
            make.top.equalTo(vc.faqButton.snp.bottom).offset(20)
            make.left.equalTo(vc.emailSupportButton)
        }
        vc.noticationButton.snp.makeConstraints { make in
            make.top.equalTo(vc.privacyButton.snp.bottom).offset(20)
            make.left.equalTo(vc.emailSupportButton)
        }
        vc.notificationSwitch.snp.makeConstraints { make in
            make.top.equalTo(vc.noticationButton)
            make.right.equalToSuperview().offset(-30)
        }
        vc.updateButton.snp.makeConstraints { make in
            make.top.equalTo(vc.noticationButton.snp.bottom).offset(20)
            make.left.equalTo(vc.emailSupportButton)
        }
        vc.updateSwitch.snp.makeConstraints { make in
            make.top.equalTo(vc.updateButton)
            make.right.equalTo(vc.notificationSwitch)
        }
    }
}
