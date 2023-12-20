//
//  SearchViewTableViewCell.swift
//  ShopIT
//
//  Created by Taha Turan on 20.12.2023.
//

import UIKit

class SearchViewTableViewCell: UITableViewCell {
    // MARK: - Properties

   private let containerView: UIView = UIView()
   private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let productTitleLabel: UILabel = {
        let productTitleLabel = UILabel()
        productTitleLabel.numberOfLines = 2
        return productTitleLabel
    }()

    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        return button
    }()

   private let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return priceLabel
    }()

    // MARK: - LifeCycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureCell() {
        containerView.addSubview(productImageView)
        containerView.addSubview(productTitleLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(favoriteButton)
        addSubview(containerView)

        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview().inset(10)
        }

        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        productTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(5)
            make.left.equalToSuperview()
            make.width.equalToSuperview()
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(productTitleLabel.snp.bottom).offset(5)
            make.centerX.equalTo(containerView.snp.centerX)
        }
        favoriteButton.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(10)
            make.trailing.equalTo(containerView.snp.trailing).offset(-10)
            make.width.height.equalTo(40)
        }
    }

    func setupViews(product: ProductElement) {
        productImageView.sd_setImage(with: URL(string: product.image))
        productTitleLabel.text = product.title
        priceLabel.text = "\(product.price)$"
    }
}
