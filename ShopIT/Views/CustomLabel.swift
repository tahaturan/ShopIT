//
//  TitleLabel.swift
//  ShopIT
//
//  Created by Taha Turan on 14.12.2023.
//

import Foundation
import UIKit

enum LabelType {
    case title
    case subTitle
}

class CustomLabel: UILabel {
   
    
    init(labelType: LabelType, text: String) {
        super.init(frame: .zero)
        setupLabel(type: labelType, text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel(type: LabelType, text: String) {
        switch type {
        case .title:
            self.text = text
            self.font = Theme.Font.titleFont
        case .subTitle:
            self.text = text
            self.font = Theme.Font.subTitleFont
            self.textColor = .gray
            self.numberOfLines = 0
            self.textAlignment = .center
        }
    }
}
