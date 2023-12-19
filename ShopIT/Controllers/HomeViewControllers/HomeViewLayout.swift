//
//  HomeViewLayout.swift
//  ShopIT
//
//  Created by Taha Turan on 19.12.2023.
//

import Foundation
import SnapKit
import UIKit

struct HomeViewLayout {
    static func setupLayout(for viewController: HomeViewController) {
        viewController.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(viewController.view.safeAreaLayoutGuide).offset(30)
            make.left.equalToSuperview().offset(20)
        }
        viewController.subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(viewController.titleLabel.snp.bottom).offset(10)
            make.left.equalTo(viewController.titleLabel)
        }
        viewController.searchBarContainer.snp.makeConstraints { make in
            make.top.equalTo(viewController.subTitleLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }

        viewController.categoryButton.snp.makeConstraints { make in
            make.top.equalTo(viewController.searchBarContainer.snp.bottom).offset(60)
            make.left.right.equalTo(viewController.searchBarContainer)
            make.height.equalTo(90)
        }
        viewController.newArrivalTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(viewController.categoryButton.snp.bottom).offset(60)
            make.left.equalTo(viewController.categoryButton)
        }
        viewController.seeAllLabel.snp.makeConstraints { make in
            make.top.equalTo(viewController.newArrivalTitleLabel)
            make.right.equalTo(viewController.categoryButton)
        }
    }
    static func setupNavigationBar(for viewController: HomeViewController) {
         viewController.navigationController?.isNavigationBarHidden = false
         viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: viewController.menuButton)
         viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: viewController.notificationButton)
         viewController.navigationItem.title = AppTextConstants.HomeViewController.navBarTitle
    }
}
