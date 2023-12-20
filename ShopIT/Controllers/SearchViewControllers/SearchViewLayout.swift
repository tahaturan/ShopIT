//
//  SearchViewLayout.swift
//  ShopIT
//
//  Created by Taha Turan on 20.12.2023.
//

import Foundation

struct SearchViewLayout {
    static func setupLayout(for viewController: SearchViewController) {
        viewController.searchBar.snp.makeConstraints { make in
            make.top.equalTo(viewController.view.safeAreaLayoutGuide).offset(10)
            make.left.right.equalToSuperview().inset(20)
        }
        viewController.recentSearchLabel.snp.makeConstraints { make in
            make.top.equalTo(viewController.searchBar.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(20)
        }
        viewController.recentButton.snp.makeConstraints { make in
            make.top.equalTo(viewController.recentSearchLabel)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(24)
        }
        viewController.dividerView.snp.makeConstraints { make in
            make.top.equalTo(viewController.recentButton.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        viewController.showResultLabel.snp.makeConstraints { make in
            make.top.equalTo(viewController.dividerView.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
        }
        viewController.collectionView.snp.makeConstraints { make in
            make.top.equalTo(viewController.showResultLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
    }
}
