//
//  HomeCollectionViewCell.swift
//  ShopIT
//
//  Created by Taha Turan on 19.12.2023.
//

import SnapKit
import UIKit
import SDWebImage

class HomeCollectionViewCell: UICollectionViewCell {
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
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 4

        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale

        layer.cornerRadius = 15
        clipsToBounds = false
    }

    func setupViews(product: ProductElement) {
        let containerView: UIView = UIView()

        let imageView: UIImageView = UIImageView()
        imageView.sd_setImage(with: URL(string: product.image))
        imageView.contentMode = .scaleAspectFit
        containerView.addSubview(imageView)

        let titleLabel: UILabel = UILabel()
        titleLabel.text = product.title
        titleLabel.numberOfLines = 2
        containerView.addSubview(titleLabel)

        let priceLabel: UILabel = UILabel()
        priceLabel.text = "\(product.price)$"
        priceLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        containerView.addSubview(priceLabel)

        addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview().inset(10)
        }

        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.left.equalToSuperview()
            make.width.equalToSuperview()
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.centerX.equalTo(containerView.snp.centerX)
        }
    }
}
