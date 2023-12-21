//
//  FilterViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 21.12.2023.
//

import UIKit

final class FilterViewController: UIViewController {
    //MARK: - Properties
    let clearButton: UIButton = {
       let button = UIButton()
        button.setTitle("Clear", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    let titleLabel: CustomLabel = CustomLabel(labelType: .title, text: "Filters")
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
    let categoryTitleLabel: CustomLabel = CustomLabel(labelType: .title, text: "Category")
    lazy var newArrivalButton: UIButton = createFilterButton(title: "New Arrival", isSelected: true)
    lazy var topTrandingButton: UIButton = createFilterButton(title: "Top Tranding")
    lazy var featuredProductsButton: UIButton = createFilterButton(title: "Featured Products")
    let pricingLabel: CustomLabel = CustomLabel(labelType: .title, text: "Pricing")
    lazy var pricingPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "$50-$200"
        label.font = Theme.Font.normalBoldFont
        return label
    }()
    lazy var priceSliderView: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 500
        
        return slider
    }()
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

//MARK: - Helper
extension FilterViewController {
    private func setupUI() {
        view.backgroundColor = .viewBackround
        FilterViewLayout.setupLayout(of: self)
    }
}

//MARK: - Factory Methods
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
