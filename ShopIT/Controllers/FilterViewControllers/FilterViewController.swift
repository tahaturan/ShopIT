//
//  FilterViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 21.12.2023.
//

import UIKit

final class FilterViewController: UIViewController {
    // MARK: - Properties

    let clearButton: UIButton = {
        let button = UIButton()
        button.setTitle(AppTextConstants.FilterViewController.clear, for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    let titleLabel: CustomLabel = CustomLabel(labelType: .title, text: AppTextConstants.FilterViewController.filters)
    let closeButton: UIButton = {
        let button = UIButton()
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 40)
        let image = UIImage(systemName: "multiply.circle.fill")?.withConfiguration(symbolConfiguration)
        button.setImage(image, for: .normal)

        button.backgroundColor = .white
        button.tintColor = .gray
        button.layer.cornerRadius = 15
        return button
    }()

    let dividerView: UIView = {
        let dividerView = UIView()
        dividerView.backgroundColor = .lightGray.withAlphaComponent(0.5)
        return dividerView
    }()

    let categoryTitleLabel: CustomLabel = CustomLabel(labelType: .title, text: AppTextConstants.FilterViewController.category)
    lazy var newArrivalButton: UIButton = createFilterButton(title: AppTextConstants.FilterViewController.newArrival, isSelected: true)
    lazy var topTrandingButton: UIButton = createFilterButton(title: AppTextConstants.FilterViewController.topTranding)
    lazy var featuredProductsButton: UIButton = createFilterButton(title: AppTextConstants.FilterViewController.featuredProducts)
    let pricingLabel: CustomLabel = CustomLabel(labelType: .title, text: AppTextConstants.FilterViewController.pricing)
    lazy var pricingPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "$0-$100"
        label.font = Theme.Font.normalBoldFont
        return label
    }()

    lazy var priceMinSlider: CustomSliderView = CustomSliderView(minValue: 0, maxValue: 100, tag: 1)
    lazy var priceMaxSlider: CustomSliderView = CustomSliderView(minValue: 100, maxValue: 500, tag: 2)
    var senderminValue = 0
    var senderMaxValue = 0
    let distanceLabel: CustomLabel = CustomLabel(labelType: .title, text: AppTextConstants.FilterViewController.distance)
    lazy var distanceValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1km-100km"
        label.font = Theme.Font.normalBoldFont
        return label
    }()

    lazy var distanceMinSlider: CustomSliderView = CustomSliderView(minValue: 1, maxValue: 100, tag: 3)
    lazy var distanceMaxSlider: CustomSliderView = CustomSliderView(minValue: 100, maxValue: 500, tag: 4)
    lazy var applyButton: PrimaryButton = PrimaryButton(title: AppTextConstants.FilterViewController.applyFilter)

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTarget()
    }
}

// MARK: - Helper

extension FilterViewController {
    private func setupUI() {
        view.backgroundColor = .viewBackround
        FilterViewLayout.setupLayout(of: self)
    }

    private func setupTarget() {
        priceMinSlider.addTarget(self, action: #selector(priceSliderValueChanged(_:)), for: .valueChanged)
        priceMaxSlider.addTarget(self, action: #selector(priceSliderValueChanged(_:)), for: .valueChanged)
        distanceMinSlider.addTarget(self, action: #selector(priceSliderValueChanged(_:)), for: .valueChanged)
        distanceMaxSlider.addTarget(self, action: #selector(priceSliderValueChanged(_:)), for: .valueChanged)

        applyButton.addTarget(self, action: #selector(applyButtonTapped(_:)), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(applyButtonTapped(_:)), for: .touchUpInside)
    }
}

// MARK: - Selector

extension FilterViewController {
    @objc private func priceSliderValueChanged(_ sender: UISlider) {
        let formatString = String(format: "%.f", sender.value)

        switch sender.tag {
        case 1:
            senderminValue = Int(sender.value)
            return pricingPriceLabel.text = "$\(senderminValue) - $\(senderMaxValue)"
        case 2:
            senderMaxValue = Int(sender.value)
            return pricingPriceLabel.text = "$\(senderminValue) - $\(senderMaxValue)"
        case 3:
            senderminValue = Int(sender.value)
            return distanceValueLabel.text = "$\(senderminValue) - $\(senderMaxValue)"
        case 4:
            senderMaxValue = Int(sender.value)
            return distanceValueLabel.text = "$\(senderminValue) - $\(senderMaxValue)"
        default:
            return pricingPriceLabel.text = "$0 - $\(formatString)"
        }
    }

    @objc private func applyButtonTapped(_ button: UIButton) {
        dismiss(animated: true)
    }
}

// MARK: - Factory Methods

extension FilterViewController {
    private func createFilterButton(title: String, isSelected: Bool = false) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(isSelected ? .white : .black, for: .normal)
        button.backgroundColor = isSelected ? .main : .white
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }
}
