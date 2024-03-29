//
//  MenuViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 28.12.2023.
//

import UIKit

protocol MenuViewControllerDelegate {
    func didSelectMenuItem(tag: Int)
}

class MenuViewController: UIViewController {
    //MARK: - Properties
    let user = UserModel.dummyUser
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = .taha
        imageView.layer.cornerRadius = Theme.Size.profileImageViewSize.width / 4
        return imageView
    }()
    lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.text = user.name
        label.font = Theme.Font.normalBoldFont
        return label
    }()
    lazy var jopLabel: UILabel = {
        let label = UILabel()
        label.text = user.jop
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .gray
         return label
     }()
    let profileButton: UIButton = {
        let button = UIButton()
        button.setImage(.buttonRight, for: .normal)
        return button
    }()
   private let favoriteButton: MenuViewButton = MenuViewButton(type: .favorite)
   private let walletsButton: MenuViewButton = MenuViewButton(type: .wallets)
   private let ordersButton: MenuViewButton = MenuViewButton(type: .orders)
   private let aboutUsButton: MenuViewButton = MenuViewButton(type: .aboutUs)
   private let privacyButton: MenuViewButton = MenuViewButton(type: .privacyPolicy)
   private let settingsButton: MenuViewButton = MenuViewButton(type: .settings)
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [favoriteButton, walletsButton, ordersButton, aboutUsButton, privacyButton, settingsButton])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .clear
        return stackView
    }()
    let logOutButton: MenuViewButton = MenuViewButton(type: .logOut)
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .logo
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()
    var delegate: MenuViewControllerDelegate?
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        buttonTargets()
    }
}
//MARK: - Helper
extension MenuViewController {
    private func setupUI(){
        view.backgroundColor = .viewBackround
        MenuViewLayout.setupLayout(in: self)
    }
    private func buttonTargets() {
        favoriteButton.addTarget(self, action: #selector(menuButtonTapped(_:)), for: .touchUpInside)
        walletsButton.addTarget(self, action: #selector(menuButtonTapped(_:)), for: .touchUpInside)
        ordersButton.addTarget(self, action: #selector(menuButtonTapped(_:)), for: .touchUpInside)
        aboutUsButton.addTarget(self, action: #selector(menuButtonTapped(_:)), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(menuButtonTapped(_:)), for: .touchUpInside)
        settingsButton.addTarget(self, action: #selector(menuButtonTapped(_:)), for: .touchUpInside)
        logOutButton.addTarget(self, action: #selector(menuButtonTapped(_:)), for: .touchUpInside)
    }
}

//MARK: - Selector
extension MenuViewController {
    @objc private func menuButtonTapped(_ sender: UIButton) {
        delegate?.didSelectMenuItem(tag: sender.tag)
        
    }
}
