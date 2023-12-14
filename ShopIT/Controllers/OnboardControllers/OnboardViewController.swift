//
//  OnboardViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 14.12.2023.
//

import UIKit
import SnapKit

protocol OnboardViewControllerDelegate {
    func startButtonTapped(_ sender: UIButton)
}

class OnboardViewController: UIViewController {

    //MARK: - Properties
    private var onboardImage: UIImageView!
    private var titleLabel: CustomLabel!
    private var subTitleLabel: CustomLabel!
    private let startButton: PrimaryButton = PrimaryButton(title: "Get Started")
    private var isLastPage = false
    var delegate: OnboardViewControllerDelegate?
    
    //MARK: - LifeCycle
    init(image: UIImage, title: String, subTitle: String, isLastPage: Bool = false) {
        super.init(nibName: nil, bundle: nil)
        self.isLastPage = isLastPage
         onboardImage = UIImageView(image: image)
         titleLabel = CustomLabel(labelType: .title, text: title)
         subTitleLabel = CustomLabel(labelType: .subTitle, text: subTitle)
         
    }
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        startButton.addTarget(self, action: #selector(startButtonTapped(_:)), for: .touchUpInside)
    }
}

//MARK: - Helper
extension OnboardViewController {
    //Setup UI
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(onboardImage)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(startButton)
    }
    
    //Setup Layout
    private func setupLayout() {
        onboardImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.5)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(onboardImage.snp.bottom)
            make.centerX.equalTo(view.snp.centerX)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(10)
        }
        if isLastPage {
            startButton.snp.makeConstraints { make in
                make.top.equalTo(subTitleLabel.snp.bottom).offset(30)
                make.centerX.equalTo(view.snp.centerX)
                make.height.equalTo(Theme.Size.primaryButtonHeight)
                make.width.equalToSuperview().multipliedBy(0.65)
            }
        }

    }
    
    @objc private func startButtonTapped(_ sender: UIButton) {
        delegate?.startButtonTapped(sender)
    }
}
