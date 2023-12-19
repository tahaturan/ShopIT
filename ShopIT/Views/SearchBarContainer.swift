//
//  SearchBarContainer.swift
//  ShopIT
//
//  Created by Taha Turan on 19.12.2023.
//

import Foundation
import UIKit

class SearchBarContainer: UIView {
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = AppTextConstants.HomeViewController.search
        searchBar.searchBarStyle = .minimal
        searchBar.barTintColor = .white
        searchBar.backgroundColor = .white
        return searchBar
    }()

    private lazy var searchFilterButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(.searchFilterIcon, for: .normal)
        button.backgroundColor = .white
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4
        
        addSubview(searchBar)
        addSubview(searchFilterButton)
        setupLayout()
    }

    private func setupLayout() {
        searchFilterButton.snp.makeConstraints { make in
            make.right.top.bottom.equalToSuperview().inset(10)
        }
        searchBar.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(10)
            make.right.equalTo(searchFilterButton.snp.left)
        }
    }
}
