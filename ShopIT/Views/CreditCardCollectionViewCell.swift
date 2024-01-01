//
//  CreditCardCollectionViewCell.swift
//  ShopIT
//
//  Created by Taha Turan on 1.01.2024.
//

import Foundation
import UIKit

class CreditCardCollectionViewCell: UICollectionViewCell {
    //MARK: - Properties
    private var cardModel: CreditCartModel! {
        didSet {
            setupGradientBackround()
        }
    }
    private let gradiendLayer = CAGradientLayer()
    
    private let containerView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        return view
    }()
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Platinum Card"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    private let creditTypeLabel: UILabel = {
      let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    private let cartIconImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(systemName: "creditcard")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        return imageView
    }()
    private let cardnumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    private let cardDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        return label
    }()
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCard()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        gradiendLayer.frame = self.bounds
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     func configureCell(in card: CreditCartModel) {
         self.cardModel = card
        creditTypeLabel.text = card.cardType.loadCartType()
        cardnumberLabel.text = card.cardNumber
        cardDateLabel.text = card.cardNumber
        cardDateLabel.text = "Valid \(card.expirationDate)"
        userNameLabel.text = card.cardHolderName
    }
}
//MARK: - Helper
extension CreditCardCollectionViewCell {
    private func setupCard() {
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(creditTypeLabel)
        containerView.addSubview(cartIconImageView)
        containerView.addSubview(cardnumberLabel)
        containerView.addSubview(cardDateLabel)
        containerView.addSubview(userNameLabel)
        
        containerView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview().inset(10)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(5)
        }
        creditTypeLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel)
            make.right.equalToSuperview().offset(-5)
        }
        cartIconImageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(titleLabel)
            make.width.height.equalTo(30)
        }
        cardnumberLabel.snp.makeConstraints { make in
            make.top.equalTo(cartIconImageView.snp.bottom).offset(30)
            make.left.equalTo(titleLabel)
        }
        cardDateLabel.snp.makeConstraints { make in
            make.top.equalTo(cardnumberLabel.snp.bottom).offset(10)
            make.left.equalTo(titleLabel)
        }
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(cardDateLabel)
            make.right.equalTo(creditTypeLabel)
        }
    }
    private func setupGradientBackround() {
        gradiendLayer.colors = cardModel.cardType.gradiendColorList()
        gradiendLayer.locations = [0.0, 0.5, 1.0]
        gradiendLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradiendLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradiendLayer.frame = bounds
        
        self.layer.insertSublayer(gradiendLayer, at: 0)
    }
}
