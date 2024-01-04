//
//  SuccessViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 28.12.2023.
//

import UIKit
import Lottie
import SnapKit

class SuccessViewController: UIViewController {
    //MARK: - Propeties
    let successAnimationView: LottieAnimationView = LottieAnimationView(name: "SuccessLottie")
    let titleLabel: CustomLabel = CustomLabel(labelType: .title, text: AppTextConstants.SuccessViewController.congratulation)
    let subTitleLabel: CustomLabel = CustomLabel(labelType: .subTitle, text: AppTextConstants.SuccessViewController.paymentIsTheTransfer)
    let receiptButton: PrimaryButton = PrimaryButton(title: AppTextConstants.SuccessViewController.yourReceipt )
    let backHomeButton: PrimaryButton = PrimaryButton(title: AppTextConstants.SuccessViewController.backToHome , isBack: true)
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationController?.isNavigationBarHidden = true
    }
}
//MARK: - Helper
extension SuccessViewController {
    private func setupUI() {
        view.backgroundColor = .viewBackround
        successAnimationView.loopMode = .playOnce
        successAnimationView.animationSpeed = 0.6
        successAnimationView.play()
        SuccessViewLayout.setupLayout(in: self)
        backHomeButton.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
    }
}
//MARK: - Selector
extension SuccessViewController {
    @objc private func backButtonTapped(_ sender: UIButton) {
        let containerViewController: UIViewController = ContainerViewController()
        
        if let windowsScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let scneDelegate = windowsScene.delegate as? SceneDelegate, let window = scneDelegate.window {
            
            UIView.transition(with: window, duration: 0.9,options: .transitionCrossDissolve, animations: {
                let oldState = UIView.areAnimationsEnabled
                
                UIView.setAnimationsEnabled(false)
                window.rootViewController = containerViewController
                UIView.setAnimationsEnabled(oldState)
            })
        }
    }
}
