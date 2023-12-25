//
//  BasketTableViewCell.swift
//  ShopIT
//
//  Created by Taha Turan on 24.12.2023.
//

import Foundation
import UIKit
import SnapKit

protocol BasketTableViewCellProtocol {
    func didTapAddButton(in cell: BasketTableViewCell, sender: UIButton)
    func didRemoveTapButton(in cell: BasketTableViewCell, sender: UIButton)
}

class BasketTableViewCell: UITableViewCell {
    //MARK: - Properties
    var delegate: BasketTableViewCellProtocol?
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        return imageView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Theme.Font.subTitleFont
        label.textColor = .gray
        label.numberOfLines = 2
        return label
    }()
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = Theme.Font.normalBoldFont
        label.textColor = .black
        return label
    }()
    private var addButton: UIButton = {
           let button = UIButton()
            button.setImage(UIImage(systemName: "plus.app"), for: .normal)
        button.tintColor = .main
            return button
        }()
        private var removeButton: UIButton = {
           let button = UIButton()
            button.setImage(UIImage(systemName: "minus.square"), for: .normal)
            button.tintColor = .darkGray
            return button
        }()
        private var quantityLabel: UILabel = {
           let label = UILabel()
            label.textColor = .black
            label.font = Theme.Font.normalBoldFont
            return label
        }()
        private var stackView = UIStackView()
    //MARK: - LifeCycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        addButtonTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        contentView.addSubview(containerView)
        containerView.addSubview(productImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(priceLabel)
        
        stackView = UIStackView(arrangedSubviews: [removeButton, quantityLabel, addButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        
        containerView.addSubview(stackView)
        
        containerView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview().inset(10)
        }
        productImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(5)
            make.height.width.equalTo(70)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalTo(productImageView.snp.right).offset(5)
            make.width.equalTo(130)
        }
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalTo(titleLabel)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(40)
            make.right.equalToSuperview().offset(-30)
        }
    }
    
     func configureCell(cartItem: CartItem) {
        productImageView.sd_setImage(with: URL(string: cartItem.imageUrl))
        titleLabel.text = cartItem.name
         priceLabel.text = "$\(cartItem.price * Double(cartItem.quantity))"
        quantityLabel.text = "\(cartItem.quantity)"
         if cartItem.quantity == 1 {
             removeButton.isHidden = true
         }else {
             removeButton.isHidden = false
         }
    }
    private func addButtonTarget() {
        addButton.addTarget(self, action: #selector(addButtonTapped(_:)), for: .touchUpInside)
        removeButton.addTarget(self, action: #selector(removeButtonTapped(_:)), for: .touchUpInside)
    }
}

//MARK: - Selector
extension BasketTableViewCell {
    @objc private func addButtonTapped(_ sender: UIButton) {
        delegate?.didTapAddButton(in: self, sender: sender)
    }
    @objc private func removeButtonTapped(_ sender: UIButton) {
        delegate?.didRemoveTapButton(in: self, sender: sender)
    }
}
