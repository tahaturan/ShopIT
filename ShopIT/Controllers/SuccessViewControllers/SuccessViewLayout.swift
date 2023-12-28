//
//  SuccessViewLayout.swift
//  ShopIT
//
//  Created by Taha Turan on 28.12.2023.
//

import Foundation

struct SuccessViewLayout {
    static func setupLayout(in vc: SuccessViewController) {
        vc.view.addSubview(vc.successAnimationView)
        vc.view.addSubview(vc.titleLabel)
        vc.view.addSubview(vc.subTitleLabel)
        vc.view.addSubview(vc.receiptButton)
        vc.view.addSubview(vc.backHomeButton)
        
        vc.successAnimationView.snp.makeConstraints { make in
            make.top.equalTo(vc.view.safeAreaLayoutGuide).offset(30)
            make.centerX.equalTo(vc.view.snp.centerX)
            make.height.width.equalTo(200)
        }
        vc.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.successAnimationView.snp.bottom).offset(50)
            make.centerX.equalTo(vc.successAnimationView)
        }
        vc.subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.titleLabel.snp.bottom).offset(10)
            make.centerX.equalTo(vc.titleLabel)
            make.width.equalToSuperview().inset(20)
        }
        vc.receiptButton.snp.makeConstraints { make in
            make.top.equalTo(vc.subTitleLabel.snp.bottom).offset(50)
            make.left.right.equalToSuperview().inset(70)
            make.height.equalTo(Theme.Size.primaryButtonHeight)
        }
        vc.backHomeButton.snp.makeConstraints { make in
            make.top.equalTo(vc.receiptButton.snp.bottom).offset(20)
            make.left.right.height.equalTo(vc.receiptButton)
        }
    }
}
