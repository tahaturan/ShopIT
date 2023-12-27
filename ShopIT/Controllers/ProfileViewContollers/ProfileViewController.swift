//
//  ProfileViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 18.12.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK: - Properties
    let profileBackrounImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .profileBack
        imageView.contentMode = .scaleAspectFill
        
        imageView.backgroundColor = .clear
        return imageView
    }()
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = .taha
        imageView.layer.cornerRadius = Theme.Size.profileImageViewSize.width / 2
        return imageView
    }()
    let nameLabel: CustomLabel = CustomLabel(labelType: .title, text: "Muhammed Taha Turan")
    let emailLabel: CustomLabel = CustomLabel(labelType: .subTitle, text: "taha@gmail.com")
    let progressButton: ProfileViewButton = ProfileViewButton(type: .progressOrder)
    let promoCodeButton: ProfileViewButton = ProfileViewButton(type: .promocodes)
    let reviewesButton: ProfileViewButton = ProfileViewButton(type: .reviewes)
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [progressButton, promoCodeButton, reviewesButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .white
        return stackView
    }()
    let informationLabel: UILabel = {
        let label = UILabel()
        label.font = Theme.Font.normalBoldFont
        label.textColor = .black
        label.text = "Personal Information"
        return label
    }()
    lazy var informationView: ProfileInfoView = ProfileInfoView()
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
//MARK: - Helper
extension ProfileViewController {
    private func setupUI() {
        view.backgroundColor = .viewBackround
        ProfileViewLayout.setupProfileLayout(on: self)
        navigationItem.title = "Profile"
    }
}
