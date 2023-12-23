//
//  DetailViewLayout.swift
//  ShopIT
//
//  Created by Taha Turan on 23.12.2023.
//

import Foundation

struct DetailViewLayout {
    static func setupLayout(of vc:DetailViewController) {
        vc.view.addSubview(vc.productImageView)
        vc.view.addSubview(vc.favoriteButton)
        vc.view.addSubview(vc.backButton)
        vc.view.addSubview(vc.productContainerView)
        vc.productContainerView.addSubview(vc.productTitleLabel)
        vc.productContainerView.addSubview(vc.productPriceLabel)
        vc.productContainerView.addSubview(vc.productDescriptonLabel)
        vc.productContainerView.addSubview(vc.addCartButton)
        
        vc.productImageView.snp.makeConstraints { make in
            make.top.equalTo(vc.view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.45)
        }
        vc.favoriteButton.snp.makeConstraints { make in
            make.top.equalTo(vc.view.safeAreaLayoutGuide).offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.width.equalTo(40)
        }
        vc.backButton.snp.makeConstraints { make in
            make.top.equalTo(vc.favoriteButton)
            make.left.equalToSuperview().offset(20)
            
        }
        vc.productContainerView.snp.makeConstraints { make in
            make.top.equalTo(vc.productImageView.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        vc.productTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.left.equalToSuperview().offset(30)
        }
        vc.productPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.productTitleLabel)
            make.right.equalToSuperview().offset(-30)
        }
        vc.productDescriptonLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.productTitleLabel.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(30)
        }
        vc.addCartButton.snp.makeConstraints { make in
            make.top.equalTo(vc.productDescriptonLabel.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(50)
            make.height.equalTo(Theme.Size.primaryButtonHeight)
        }
    }
}
