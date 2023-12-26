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
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
//MARK: - Helper
extension ProfileViewController {
    private func setupUI() {
        view.backgroundColor = .white
        ProfileViewLayout.setupProfileLayout(on: self)
        navigationItem.title = "Profile"
    }
}
