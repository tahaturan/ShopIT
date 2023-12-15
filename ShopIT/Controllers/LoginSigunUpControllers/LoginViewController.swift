//
//  LoginViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 15.12.2023.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Properties
    private let logoImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = .logo
        return imageView
    }()
    private let titleLabel: CustomLabel = CustomLabel(labelType: .title, text: "Log in")
    private let emailTextField: CustomTextField = CustomTextField(type: .email)
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

//MARK: - Helper
extension LoginViewController {
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(logoImage)
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
    }
    
    private func setupLayout() {
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom)
            make.centerX.equalTo(view.snp.centerX)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(Theme.Size.defaultTextFieldHeight)
        }
    }
}
