//
//  HomeCollectionViewCell.swift
//  ShopIT
//
//  Created by Taha Turan on 19.12.2023.
//

import SDWebImage
import SnapKit
import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
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
        button.tintColor = .black
        button.layer.cornerRadius = 20
        return button
    }()

    private let priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return priceLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureCell() {
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 10
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        layer.cornerRadius = 15
        clipsToBounds = false

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
            make.top.equalTo(containerView.snp.top)
            make.trailing.equalTo(containerView.snp.trailing)
            make.width.height.equalTo(40)
        }
    }

    func setupViews(product: ProductElement) {
        productImageView.sd_setImage(with: URL(string: product.image))
        productTitleLabel.text = product.title
        priceLabel.text = "\(product.price)$"
    }
}