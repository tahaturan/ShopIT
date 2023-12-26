//
//  FavoriteViewLayout.swift
//  ShopIT
//
//  Created by Taha Turan on 25.12.2023.
//

import Foundation

struct FavoriteViewLayout {
    static func setupLayout(on vc: FavoriteViewController) {
        vc.view.addSubview(vc.collectionView)
        vc.view.addSubview(vc.emptyViewImage)
        
        vc.collectionView.snp.makeConstraints { make in
            make.top.bottom.equalTo(vc.view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview().inset(30)
        }
        vc.emptyViewImage.snp.makeConstraints { make in
            make.centerX.equalTo(vc.view.snp.centerX)
            make.centerY.equalTo(vc.view.snp.centerY)
            make.width.height.equalTo(200)
        }
        
    }
}
