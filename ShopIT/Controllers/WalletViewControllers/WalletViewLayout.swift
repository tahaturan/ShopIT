//
//  WalletViewLayout.swift
//  ShopIT
//
//  Created by Taha Turan on 1.01.2024.
//

import Foundation
import SnapKit

struct WalletViewLayout {
    static func setupLayout(in vc: WalletsViewController) {
        vc.view.addSubview(vc.titleLabel)
        
        vc.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(vc.view.safeAreaLayoutGuide)
            make.centerX.equalTo(vc.view.snp.centerX)
        }
    }
}
