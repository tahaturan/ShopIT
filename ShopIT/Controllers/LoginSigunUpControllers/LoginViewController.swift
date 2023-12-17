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
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let titleLabel: CustomLabel = CustomLabel(labelType: .title, text: AppTextConstants.LoginViewController.title)
    private let emailTextField: CustomTextField = CustomTextField(type: .email)
    private let passwordTextField: CustomTextField = CustomTextField(type: .password)
    private let forgotPasswordLabel: UILabel = {
       let label = UILabel()
        label.text = AppTextConstants.LoginViewController.forgotPassword
        label.textColor = .darkGray
        return label
    }()
    private let loginButton: PrimaryButton = PrimaryButton(title: AppTextConstants.LoginViewController.loginText)
    private lazy var orView: UIView = createOrLabelView()
    private let googleButton: CircularIconButton = CircularIconButton(icon: .facebook)
    private let facebookButton: CircularIconButton = CircularIconButton(icon: .google)
    private lazy var signUPlabel: UILabel = {
       let label = UILabel()
        label.attributedText = self.configureLabelText(boldText: "Sign Up", normalText: "Don't have an account? ", reverse: false)
        return label
    }()
    
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
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordLabel)
        view.addSubview(loginButton)
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
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(Theme.Size.defaultTextFieldHeight)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.left.right.height.equalTo(emailTextField)
        }
        forgotPasswordLabel.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.right.equalTo(view.snp.right).offset(-20)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(80)
            make.height.equalTo(Theme.Size.primaryButtonHeight)
        }
        orView.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(50)
            make.left.right.equalToSuperview()
        }
        
        googleButton.snp.makeConstraints { make in
            make.top.equalTo(orView.snp.bottom).offset(30)
            make.left.equalTo(view.snp.left).offset(110)
            make.height.width.equalTo(Theme.Size.socialButonSize.width)
        }
        
        facebookButton.snp.makeConstraints { make in
            make.top.height.width.equalTo(googleButton)
            make.left.equalTo(googleButton.snp.right).offset(40)
        }
        signUPlabel.snp.makeConstraints { make in
            make.top.equalTo(facebookButton.snp.bottom).offset(50)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
}

//MARK: - Factory Methods
extension LoginViewController {
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
        
        //Layout
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
