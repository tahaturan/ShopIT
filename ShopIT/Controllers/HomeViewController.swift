//
//  HomeViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 18.12.2023.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    //MARK: - Properties
    private lazy var menuButton: UIButton = createNavButton(image: .menuIcon)
    private lazy var notificationButton: UIButton = createNavButton(image: UIImage(systemName: "bell")!)
    private let titleLabel: CustomLabel = CustomLabel(labelType: .title, text: AppTextConstants.HomeViewController.title)
    private let subTitleLabel: CustomLabel = CustomLabel(labelType: .subTitle, text: AppTextConstants.HomeViewController.subTitle)
    private let searchBarContainer: UIView = {
       let container = UIView()
        container.backgroundColor = .white
        container.layer.cornerRadius = 10
        container.layer.shadowColor = UIColor.black.cgColor
        container.layer.shadowOpacity = 0.1
        container.layer.shadowOffset = CGSize(width: 0, height: 2)
        container.layer.shadowRadius = 4
        return container
    }()
    private lazy var searchFilterButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(.searchFilterIcon, for: .normal)
        button.backgroundColor = .white
        return button
    }()
    private let searchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.placeholder = AppTextConstants.HomeViewController.search
        searchBar.searchBarStyle = .minimal
        searchBar.barTintColor = .white
        searchBar.backgroundColor = .white
        return searchBar
    }()
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        setupNavigationBar()
    }
}

//MARK: - Setup UI/Layout
extension HomeViewController {
    private func setupUI() {
        view.backgroundColor = .viewBackround
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(searchBarContainer)
        searchBarContainer.addSubview(searchBar)
        searchBarContainer.addSubview(searchFilterButton)
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.left.equalToSuperview().offset(20)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(titleLabel)
        }
        searchBarContainer.snp.makeConstraints { make in
            make.top.equalTo(subTitleLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
        searchFilterButton.snp.makeConstraints { make in
            make.right.top.bottom.equalToSuperview().inset(10)
           
            
        }
        searchBar.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(10)
            make.right.equalTo(searchFilterButton.snp.left)
        }
    }
}

//MARK: - Helper
extension HomeViewController {
    private func setupNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: notificationButton)
        navigationItem.title = AppTextConstants.HomeViewController.navBarTitle
    }
}

//MARK: - Factory
extension HomeViewController {
    private func createNavButton(image: UIImage) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .darkGray
        return button
    }
}
