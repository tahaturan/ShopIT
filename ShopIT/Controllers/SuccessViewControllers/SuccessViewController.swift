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
    let titleLabel: CustomLabel = CustomLabel(labelType: .title, text: "Congratulation!!!")
    let subTitleLabel: CustomLabel = CustomLabel(labelType: .subTitle, text: "Payment is the transfer of money services in exchange product or Payments")
    let receiptButton: PrimaryButton = PrimaryButton(title: "Get your receipt")
    let backHomeButton: PrimaryButton = PrimaryButton(title: "Back to Home", isBack: true)
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
