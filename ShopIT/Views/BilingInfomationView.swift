//
//  BilingInfomationView.swift
//  ShopIT
//
//  Created by Taha Turan on 27.12.2023.
//

import Foundation
import SnapKit
import UIKit

class BilingInfomationView: UIView {
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .clear
        containerView.layer.cornerRadius = 10
        return containerView
    }()
    let deliveryLabel: CustomLabel = CustomLabel(labelType: .subTitle, text: "Delivery Fee   :")
    let deliveryValueLabel: UILabel = {
        let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.text = "$50"
         return label
     }()
    let subTotalLabel: CustomLabel = CustomLabel(labelType: .subTitle, text: "Subtotal          :")
    let subTotalValueLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.7)
        return view
    }()
    let totalLabel: CustomLabel = CustomLabel(labelType: .subTitle, text: "Total                 :")
    let totalValueLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    init(subTotal: Double) {
        super.init(frame: .zero)
        setupUI()
        configureView(subTotal: subTotal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(deliveryLabel)
        containerView.addSubview(deliveryValueLabel)
        containerView.addSubview(subTotalLabel)
        containerView.addSubview(subTotalValueLabel)
        containerView.addSubview(dividerView)
        containerView.addSubview(totalLabel)
        containerView.addSubview(totalValueLabel)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 5
        
        
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-20)
        }
        deliveryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        deliveryValueLabel.snp.makeConstraints { make in
            make.top.equalTo(deliveryLabel)
            make.right.equalToSuperview()
        }
        subTotalLabel.snp.makeConstraints { make in
            make.top.equalTo(deliveryLabel.snp.bottom).offset(10)
            make.left.equalTo(deliveryLabel)
        }
        subTotalValueLabel.snp.makeConstraints { make in
            make.top.equalTo(subTotalLabel)
            make.right.equalTo(deliveryValueLabel)
        }
        dividerView.snp.makeConstraints { make in
            make.top.equalTo(subTotalLabel.snp.bottom).offset(15)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        totalLabel.snp.makeConstraints { make in
            make.top.equalTo(dividerView.snp.bottom).offset(10)
            make.left.equalTo(deliveryLabel)
        }
        totalValueLabel.snp.makeConstraints { make in
            make.top.equalTo(totalLabel)
            make.right.equalTo(deliveryValueLabel)
        }
    }
    
    private func configureView(subTotal: Double) {
        subTotalValueLabel.text = "$\(subTotal)"
        totalValueLabel.text = "$\(subTotal + 50.0)"
    }
}
