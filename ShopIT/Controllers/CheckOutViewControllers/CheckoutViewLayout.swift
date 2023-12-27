//
//  CheckoutViewLayout.swift
//  ShopIT
//
//  Created by Taha Turan on 27.12.2023.
//

import Foundation

struct CheckoutViewLayout {
    static func setupLayout(in vc: CheckoutViewController) {
        vc.view.addSubview(vc.addressLabel)
        vc.view.addSubview(vc.homeAddressView)
        vc.view.addSubview(vc.officeAddressView)
        vc.view.addSubview(vc.infoLabel)
        vc.view.addSubview(vc.infoView)
        vc.view.addSubview(vc.paymentLabel)
        vc.view.addSubview(vc.buttonStackView)
        vc.view.addSubview(vc.swipeButton)
        
        vc.addressLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.view.safeAreaLayoutGuide).offset(10)
            make.left.equalToSuperview().offset(10)
        }
        vc.homeAddressView.snp.makeConstraints { make in
            make.top.equalTo(vc.addressLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(10)
            make.height.equalTo(120)
        }
        vc.officeAddressView.snp.makeConstraints { make in
            make.top.equalTo(vc.homeAddressView.snp.bottom).offset(10)
            make.left.right.height.equalTo(vc.homeAddressView)
        }
        vc.infoLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.officeAddressView.snp.bottom).offset(20)
            make.left.equalTo(vc.addressLabel)
        }
        vc.infoView.snp.makeConstraints { make in
            make.top.equalTo(vc.infoLabel.snp.bottom).offset(10)
            make.left.right.equalTo(vc.homeAddressView)
            make.height.equalTo(140)
        }
        vc.paymentLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.infoView.snp.bottom).offset(10)
            make.left.equalTo(vc.addressLabel)
        }
        vc.buttonStackView.snp.makeConstraints { make in
            make.top.equalTo(vc.paymentLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(50)
        }
        vc.swipeButton.snp.makeConstraints { make in
            make.top.equalTo(vc.buttonStackView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(50)
            make.height.equalTo(60)
        }
    }
}
