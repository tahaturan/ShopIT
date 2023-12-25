//
//  Extensions.swift
//  ShopIT
//
//  Created by Taha Turan on 17.12.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func configureLabelText(boldText: String, normalText: String, reverse:Bool = true) -> NSMutableAttributedString {
        
        if reverse {
            let boldAttributes: [NSAttributedString.Key: Any] = [.font: Theme.Font.titleFont, .foregroundColor: UIColor.black]
            let normalAttributes: [NSAttributedString.Key: Any] = [.font: Theme.Font.subTitleFont, .foregroundColor: UIColor.darkGray]
            
            let attributedString = NSMutableAttributedString(string: "")
            
             let boldAttributedString = NSAttributedString(string: boldText, attributes: boldAttributes)
            attributedString.append(boldAttributedString)
            
            let normalAttributedString = NSAttributedString(string: normalText, attributes: normalAttributes)
            attributedString.append(normalAttributedString)
            
            return attributedString
        }else {
            let boldAttributes: [NSAttributedString.Key: Any] = [.font: Theme.Font.normalBoldFont, .foregroundColor: UIColor.black]
            let normalAttributes: [NSAttributedString.Key: Any] = [.font: Theme.Font.subTitleFont, .foregroundColor: UIColor.darkGray]
            
            let attributedString = NSMutableAttributedString(string: "")
            
            let normalAttributedString = NSAttributedString(string: normalText, attributes: normalAttributes)
            attributedString.append(normalAttributedString)
            
             let boldAttributedString = NSAttributedString(string: boldText, attributes: boldAttributes)
            attributedString.append(boldAttributedString)
            
            
            
            return attributedString
        }
    }
    func showAlert(title: String, message: String, buttonTitle: String = "Ok") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default))
        self.present(alert, animated: true)
    }
}

extension UIImage {
    func resize(to size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat)  {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
}
