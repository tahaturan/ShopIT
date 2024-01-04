//
//  SettingsViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 2.01.2024.
//

import UIKit

class SettingsViewController: UIViewController {
    //MARK: - Properties
    let titleLabel: CustomLabel = CustomLabel(labelType: .title, text: AppTextConstants.SettingsViewController.settings)
    let emailSupportButton: MenuViewButton = MenuViewButton(type: .emailSupport)
    let faqButton: MenuViewButton = MenuViewButton(type: .faq)
    let privacyButton: MenuViewButton = MenuViewButton(type: .privacyStetesment)
    let noticationButton: MenuViewButton = MenuViewButton(type: .notification)
    let updateButton: MenuViewButton = MenuViewButton(type: .update)
    let notificationSwitch: UISwitch = {
        let switchButton = UISwitch()
        switchButton.onTintColor = .main
        switchButton.thumbTintColor = .white
        return switchButton
    }()
    let updateSwitch: UISwitch = {
        let switchButton = UISwitch()
        switchButton.onTintColor = .main
        switchButton.thumbTintColor = .white
        return switchButton
    }()
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
//MARK: - Helper
extension SettingsViewController {
    private func setupUI() {
        view.backgroundColor = .viewBackround
        SettingsViewLayout.setupLayout(in: self)
    }
}
