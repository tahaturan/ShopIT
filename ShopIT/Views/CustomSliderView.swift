//
//  CustomSliderView.swift
//  ShopIT
//
//  Created by Taha Turan on 22.12.2023.
//

import Foundation
import SnapKit
import UIKit

class CustomSliderView: UISlider {
    private let valueLabel: UILabel = UILabel()
    
    init(minValue: Float, maxValue: Float, tag: Int) {
        super.init(frame: .zero)
        setupSlider(minValue: minValue, maxValue: maxValue, tag: tag)
        setupValueLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        updateValueLabelPosition()
    }
    
    private func setupSlider(minValue: Float, maxValue: Float, tag: Int) {
        self.tag = tag
        minimumValue = minValue
        maximumValue = maxValue
        tintColor = .main
        thumbTintColor = .main
        addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    private func setupValueLabel() {
        addSubview(valueLabel)
        valueLabel.textAlignment = .center
        valueLabel.text = "\(Int(value))"
        valueLabel.backgroundColor = .white
        valueLabel.layer.shadowOpacity = 0.2
        valueLabel.layer.shadowRadius = 3
        valueLabel.layer.shadowOffset = CGSize(width: 0, height: 2)
        valueLabel.layer.shadowColor = UIColor.black.cgColor
    }
    @objc private func sliderValueChanged(_ sender: UISlider) {
        valueLabel.text = "\(Int(sender.value))"
        updateValueLabelPosition()
    }
    
    private func updateValueLabelPosition() {
        let thumbRect = self.thumbRect(forBounds: bounds, trackRect: trackRect(forBounds: bounds), value: value)
        valueLabel.frame = CGRect(x: thumbRect.midX - (valueLabel.frame.width / 2),
                                  y: thumbRect.origin.y - valueLabel.frame.height - 10,
                                  width: 50,
                                  height: 20)
    }
}
