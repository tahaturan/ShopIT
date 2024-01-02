//
//  OrderTableViewCell.swift
//  ShopIT
//
//  Created by Taha Turan on 2.01.2024.
//

import SnapKit
import UIKit

class OrderTableViewCell: UITableViewCell {
    // MARK: - Properties

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private let orderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .black
        return label
    }()

    private let subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        label.textColor = .gray
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()

    private let dateFormatter = DateFormatter()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        dateFormatter.dateFormat = "d MMMM yyyy"
    }

    private func setupCell() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 10
        clipsToBounds = false
        backgroundColor = .clear
        addSubview(containerView)
        containerView.addSubview(orderImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subTitleLabel)
        containerView.addSubview(priceLabel)
        
        containerView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
        }
        orderImageView.snp.makeConstraints { make in
            make.centerY.equalTo(containerView.snp.centerY)
            make.left.equalToSuperview()
            make.width.height.equalTo(65)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.left.equalTo(orderImageView.snp.right).offset(10)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(titleLabel)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(45)
            make.right.equalToSuperview().offset(-10)
        }
    }

    func configureCell(order: OrderItem) {
        orderImageView.sd_setImage(with: URL(string: order.imageUrl))
        titleLabel.text = "\(order.quantity)X - \(order.name)"
        priceLabel.text = "$\(order.price * Double(order.quantity))"
        subTitleLabel.text = dateFormatter.string(from: order.date)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
