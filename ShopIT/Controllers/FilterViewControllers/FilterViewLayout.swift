//
//  FilterViewLayout.swift
//  ShopIT
//
//  Created by Taha Turan on 21.12.2023.
//

import Foundation
import SnapKit

struct FilterViewLayout {
    static func setupLayout(of vc: FilterViewController) {
        vc.view.addSubview(vc.clearButton)
        vc.view.addSubview(vc.titleLabel)
        vc.view.addSubview(vc.closeButton)
        vc.view.addSubview(vc.dividerView)
        vc.view.addSubview(vc.categoryTitleLabel)
        vc.view.addSubview(vc.newArrivalButton)
        vc.view.addSubview(vc.topTrandingButton)
        vc.view.addSubview(vc.featuredProductsButton)
        vc.view.addSubview(vc.pricingLabel)
        vc.view.addSubview(vc.pricingPriceLabel)
        vc.view.addSubview(vc.priceMinSlider)
        vc.view.addSubview(vc.priceMaxSlider)
        vc.view.addSubview(vc.distanceLabel)
        vc.view.addSubview(vc.distanceValueLabel)
        vc.view.addSubview(vc.distanceMinSlider)
        vc.view.addSubview(vc.distanceMaxSlider)
        vc.view.addSubview(vc.applyButton)
        
        vc.clearButton.snp.makeConstraints { make in
            make.top.equalTo(vc.view.safeAreaLayoutGuide).offset(15)
            make.left.equalTo(vc.view.snp.left).offset(15)
        }
        vc.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.clearButton)
            make.centerX.equalTo(vc.view.snp.centerX)
        }
        vc.closeButton.snp.makeConstraints { make in
            make.top.equalTo(vc.clearButton)
            make.right.equalToSuperview().offset(-15)
            make.width.height.equalTo(30)
        }
        vc.dividerView.snp.makeConstraints { make in
            make.top.equalTo(vc.clearButton.snp.bottom).offset(15)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        vc.categoryTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.dividerView.snp.bottom).offset(10)
            make.left.equalTo(vc.clearButton)
        }
        vc.newArrivalButton.snp.makeConstraints { make in
            make.top.equalTo(vc.categoryTitleLabel.snp.bottom).offset(10)
            make.left.equalTo(vc.clearButton)
            make.width.equalTo(110)
            make.height.equalTo(50)
        }
        vc.topTrandingButton.snp.makeConstraints { make in
            make.top.equalTo(vc.categoryTitleLabel.snp.bottom).offset(10)
            make.left.equalTo(vc.newArrivalButton.snp.right).offset(10)
            make.width.equalTo(110)
            make.height.equalTo(50)
        }
        vc.featuredProductsButton.snp.makeConstraints { make in
            make.top.equalTo(vc.categoryTitleLabel.snp.bottom).offset(10)
            make.right.equalTo(vc.closeButton)
            make.width.equalTo(110)
            make.height.equalTo(50)
        }
        vc.pricingLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.featuredProductsButton.snp.bottom).offset(15)
            make.left.equalTo(vc.clearButton)
        }
        vc.pricingPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.pricingLabel).offset(6)
            make.right.equalTo(vc.closeButton)
        }
        vc.priceMinSlider.snp.makeConstraints { make in
            make.top.equalTo(vc.pricingLabel.snp.bottom).offset(50)
            make.left.equalToSuperview()
            make.width.equalTo(vc.view.frame.width / 2)
        }
        vc.priceMaxSlider.snp.makeConstraints { make in
            make.top.equalTo(vc.priceMinSlider)
            make.left.equalTo(vc.priceMinSlider.snp.right).offset(-2.5)
            make.width.equalTo(vc.view.frame.width / 2)
        }
        vc.distanceLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.priceMinSlider.snp.bottom).offset(20)
            make.left.equalTo(vc.pricingLabel)
        }
        vc.distanceValueLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.distanceLabel).offset(6)
            make.right.equalTo(vc.pricingPriceLabel)
        }
        vc.distanceMinSlider.snp.makeConstraints { make in
            make.top.equalTo(vc.distanceLabel.snp.bottom).offset(50)
            make.left.equalToSuperview()
            make.width.equalTo(vc.priceMinSlider)
        }
        vc.distanceMaxSlider.snp.makeConstraints { make in
            make.top.equalTo(vc.distanceMinSlider)
            make.left.equalTo(vc.distanceMinSlider.snp.right).offset(-2.5)
            make.width.equalTo(vc.priceMaxSlider)
        }
        vc.applyButton.snp.makeConstraints { make in
            make.top.equalTo(vc.distanceMinSlider.snp.bottom).offset(50)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(Theme.Size.primaryButtonHeight)
        }
    }
}
