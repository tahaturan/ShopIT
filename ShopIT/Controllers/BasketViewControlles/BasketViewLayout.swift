//
//  BasketViewLayout.swift
//  ShopIT
//
//  Created by Taha Turan on 24.12.2023.
//

import Foundation

struct BasketViewLayout {
    static func setupLayout(of vc: BasketViewController) {
        vc.view.addSubview(vc.emptyImageView)
        vc.view.addSubview(vc.tableView)
        vc.view.addSubview(vc.subTotalLabel)
        vc.view.addSubview(vc.totalPriceLabel)
        vc.view.addSubview(vc.cehckoutButton)

        vc.emptyImageView.snp.makeConstraints { make in
            make.centerX.equalTo(vc.view.snp.centerX)
            make.centerY.equalTo(vc.view.snp.centerY)
            make.width.height.equalTo(200)
        }
            vc.cehckoutButton.snp.makeConstraints { make in
                make.bottom.equalTo(vc.view.safeAreaLayoutGuide).offset(-10)
                make.left.right.equalToSuperview().inset(40)
                make.height.equalTo(Theme.Size.primaryButtonHeight)
            }
            vc.subTotalLabel.snp.makeConstraints { make in
                make.bottom.equalTo(vc.cehckoutButton.snp.top).offset(-20)
                make.left.equalToSuperview().offset(20)
            }
            vc.totalPriceLabel.snp.makeConstraints { make in
                make.bottom.equalTo(vc.subTotalLabel)
                make.right.equalToSuperview().offset(-20)
            }

            vc.tableView.snp.makeConstraints { make in
                make.top.equalTo(vc.view.safeAreaLayoutGuide)
                make.left.right.equalToSuperview()
                make.bottom.equalTo(vc.subTotalLabel.snp.top).offset(-5)
            }
        }
    }
