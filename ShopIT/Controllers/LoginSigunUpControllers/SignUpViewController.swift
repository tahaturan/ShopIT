//
//  SignUpViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 17.12.2023.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    // MARK: - Properties

    private let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .logo
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let titleLabel: CustomLabel = CustomLabel(labelType: .title, text: AppTextConstants.LoginViewController.signUpText)
    private let emailTextField: CustomTextField = CustomTextField(type: .email)
    private let passwordTextField: CustomTextField = CustomTextField(type: .password)
    private let nameTextField: CustomTextField = CustomTextField(type: .name)
    private let checkBoxButton: CustomCheckButton = CustomCheckButton()
    private lazy var forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.attributedText = configureLabelText(boldText: AppTextConstants.LoginViewController.termsContionsText , normalText: AppTextConstants.LoginViewController.acceptAllText , reverse: false)
        
        return label
    }()

    private let signUpButton: PrimaryButton = PrimaryButton(title: AppTextConstants.LoginViewController.signUpText)
    private lazy var orView: UIView = createOrLabelView()
    private let googleButton: CircularIconButton = CircularIconButton(icon: .facebook)
    private let facebookButton: CircularIconButton = CircularIconButton(icon: .google)
    private lazy var signUPlabel: UILabel = {
        let label = UILabel()
        label.attributedText = self.configureLabelText(boldText: AppTextConstants.LoginViewController.loginText, normalText: AppTextConstants.LoginViewController.alreadyHaveAccountText, reverse: false)
        return label
    }()

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(signUpTapped))
        signUPlabel.isUserInteractionEnabled = true
        signUPlabel.addGestureRecognizer(tapGesture)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

// MARK: - Helper

extension SignUpViewController {
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(logoImage)
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(nameTextField)
        view.addSubview(checkBoxButton)
        view.addSubview(forgotPasswordLabel)
        view.addSubview(signUpButton)
        view.addSubview(orView)
        view.addSubview(googleButton)
        view.addSubview(facebookButton)
        view.addSubview(signUPlabel)
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
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(Theme.Size.defaultTextFieldHeight)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(Theme.Size.defaultTextFieldHeight)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.left.right.height.equalTo(emailTextField)
        }
        checkBoxButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.left.equalTo(view.snp.left).offset(20)
        }
        forgotPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.left.equalTo(checkBoxButton.snp.right).offset(5)
        }
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(80)
            make.height.equalTo(Theme.Size.primaryButtonHeight)
        }
        orView.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
        }

        googleButton.snp.makeConstraints { make in
            make.top.equalTo(orView.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(110)
            make.height.width.equalTo(Theme.Size.socialButonSize.width)
        }

        facebookButton.snp.makeConstraints { make in
            make.top.height.width.equalTo(googleButton)
            make.left.equalTo(googleButton.snp.right).offset(40)
        }
        signUPlabel.snp.makeConstraints { make in
            make.top.equalTo(facebookButton.snp.bottom).offset(30)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}

// MARK: - Factory Methods

extension SignUpViewController {
    private func createOrLabelView() -> UIView {
        let containerView: UIView = UIView()

        let orLabel: UILabel = UILabel()
        orLabel.text = "Or"
        orLabel.textAlignment = .center

        containerView.addSubview(orLabel)

        let leftLine: UIView = UIView()
        leftLine.backgroundColor = .darkGray

        containerView.addSubview(leftLine)

        let rightLine: UIView = UIView()
        rightLine.backgroundColor = .darkGray

        containerView.addSubview(rightLine)

        // Layout
        orLabel.snp.makeConstraints { make in
            make.center.equalTo(containerView)
        }

        leftLine.snp.makeConstraints { make in
            make.centerY.equalTo(orLabel.snp.centerY)
            make.right.equalTo(orLabel.snp.left).offset(-20)
            make.height.equalTo(1)
            make.width.equalTo(containerView.snp.width).multipliedBy(0.26)
        }

        rightLine.snp.makeConstraints { make in
            make.left.equalTo(orLabel.snp.right).offset(20)
            make.height.width.centerY.equalTo(leftLine)
        }

        return containerView
    }
}

// MARK: - Selector

extension SignUpViewController {
    @objc private func signUpTapped() {
        navigationController?.popToRootViewController(animated: true)
    }
}
