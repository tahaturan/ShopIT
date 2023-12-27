//
//  CheckoutViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 27.12.2023.
//

import UIKit

class CheckoutViewController: UIViewController {
    //MARK: - Properties
    var subTotal = 0.0
    
    let addressLabel: CustomLabel = CustomLabel(labelType: .title, text: "Delivery address")
    let homeAddressView: AddressView = AddressView(type: .home)
    let officeAddressView: AddressView = AddressView(type: .office)
    let infoLabel: CustomLabel = CustomLabel(labelType: .title, text: "Biling information")
    lazy var infoView: BilingInfomationView = BilingInfomationView(subTotal: subTotal)
    let paymentLabel: CustomLabel = CustomLabel(labelType: .title, text: "Payment Method")
    lazy var visaButton: UIButton = createPaymentButton(image: .visa)
    lazy var masterCartButton: UIButton = createPaymentButton(image: .mastercard)
    lazy var paypalButton: UIButton = createPaymentButton(image: .paypal)
    lazy var bitcoinButton: UIButton = createPaymentButton(image: .bitcoin)
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [visaButton, masterCartButton, paypalButton, bitcoinButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    let swipeButton: SwipeButton = SwipeButton()

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
//MARK: - Helper
extension CheckoutViewController {
    private func setupUI() {
        navigationItem.title = "Checkout"
        view.backgroundColor = .viewBackround
        navigationController?.navigationBar.backIndicatorImage = .backIcon
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = .backIcon
        navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .black
        
        swipeButton.delegate = self
        CheckoutViewLayout.setupLayout(in: self)
    }
}

//MARK: - Factory Method
extension CheckoutViewController {
    private func createPaymentButton(image: UIImage) -> UIButton {
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 5
        button.contentMode = .scaleAspectFill
        return button
    }
}
//MARK: -
extension CheckoutViewController: SwipeButtonProtocolDelagate {
    func didFinishSwipe() {
        print("Okkey")
    }
}
