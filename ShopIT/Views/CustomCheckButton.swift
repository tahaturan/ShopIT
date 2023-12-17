//
//  CustomCheckButton.swift
//  ShopIT
//
//  Created by Taha Turan on 17.12.2023.
//

import Foundation
import UIKit

class CustomCheckButton: UIButton {
    var isChecked: Bool = true {
        didSet {
            if isChecked {
                setImage(UIImage(systemName: "square"), for: .normal)
            } else {
                setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
                
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.addTarget(self, action: #selector(toggleCheckBox), for: .touchUpInside)
        setImage(UIImage(systemName: "square"), for: .normal)
        tintColor = .main
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func toggleCheckBox() {
        isChecked = !isChecked
    }
}
