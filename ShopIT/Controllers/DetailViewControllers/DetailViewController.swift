//
//  DetailViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 23.12.2023.
//

import UIKit

class DetailViewController: UIViewController {
    //MARK: - Properties
    var product: ProductElement?
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        return imageView
    }()
     let favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.backgroundColor = .detail
        button.tintColor = .black
        button.layer.cornerRadius = 20
        return button
    }()
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = .darkGray
        return button
    }()
    
    let productContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .detail
        return view
    }()
    let productTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Theme.Font.titleFont
        return label
    }()
    let productPriceLabel: UILabel = {
        let label = UILabel()
        label.font = Theme.Font.titleFont
        return label
    }()
    let productDescriptonLabel: UILabel = {
        let label = UILabel()
        label.font = Theme.Font.subTitleFont
        label.numberOfLines = 0
        label.textColor = .lightGray
        return label
    }()
    let addCartButton: PrimaryButton = PrimaryButton(title: "Add to Cart")
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        setupUI()
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
       navigationController?.isNavigationBarHidden = true
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        productContainerView.roundCorners(corners: [.topLeft, .topRight], radius: 50)
    }
}

//MARK: - Helper
extension DetailViewController {
    private func setupUI() {
        view.backgroundColor = .white
        
        DetailViewLayout.setupLayout(of: self)
        setupProduct()
        buttonTarget()
    }

    private func setupProduct() {
        if let product = product {
            productImageView.sd_setImage(with: URL(string: product.image))
            productTitleLabel.text = product.title
            productPriceLabel.text = "$\(product.price )"
            productDescriptonLabel.text = product.description
        }
    }
    private func buttonTarget() {
        backButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        addCartButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        
    }
}
//MARK: - Selector
extension DetailViewController {
    @objc private func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
