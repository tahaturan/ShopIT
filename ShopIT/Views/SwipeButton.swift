//
//  SwipeButton.swift
//  ShopIT
//
//  Created by Taha Turan on 27.12.2023.
//

import Foundation
import UIKit
import SnapKit

protocol SwipeButtonProtocolDelagate {
    func didFinishSwipe()
}

class SwipeButton: UIButton {
    private let circleView = UIView()
    private var circleViewWidth: CGFloat = 40
    private let threshold: CGFloat = 0.9 // esik degeri
    let swipeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.right")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .main
        return imageView
    }()
    var delegate: SwipeButtonProtocolDelagate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
        addPanGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        self.backgroundColor = .main
        self.layer.cornerRadius = Theme.Size.primaryButtonCornerRadius
        self.setTitle("Swipe for Payment", for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        self.titleLabel?.textColor = .white
        circleView.backgroundColor = .white
        circleView.frame = CGRect(x: 10, y: 10, width: circleViewWidth, height: circleViewWidth)
        circleView.layer.cornerRadius = circleViewWidth / 2
        addSubview(circleView)
        circleView.addSubview(swipeIcon)
        
        swipeIcon.snp.makeConstraints { make in
            make.centerX.equalTo(circleView.snp.centerX)
            make.centerY.equalTo(circleView.snp.centerY)
        }
    }
    
    private func addPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        self.addGestureRecognizer(panGesture)
    }
    @objc private func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        gesture.setTranslation(.zero, in: self)
        
        var newCenterX = circleView.center.x + translation.x
        newCenterX = max(circleViewWidth / 2, newCenterX)
        newCenterX = min(self.bounds.width - circleViewWidth / 2, newCenterX)
        
        circleView.center = CGPoint(x: newCenterX, y: circleView.center.y)
        
        if gesture.state == .ended {
            let hasReachedThreshold = newCenterX > self.bounds.width * threshold
            
            if hasReachedThreshold {
                didFinishSwippe()
            } else {
                resetCircleView()
            }
        }
    }
    
    private func resetCircleView() {
        UIView.animate(withDuration: 0.5) {
            self.circleView.center = CGPoint(x: self.circleViewWidth / 2 + 10, y: self.circleView.center.y)
        }
    }
    
    private func didFinishSwippe() {
        delegate?.didFinishSwipe()
    }
}
