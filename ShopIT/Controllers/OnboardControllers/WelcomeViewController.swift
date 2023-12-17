//
//  WelcomeViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 14.12.2023.
//

import UIKit
import SnapKit

class WelcomeViewController: UIPageViewController {

    //MARK: - Properties
    private var pages: [UIViewController] = []
    private var pageControl: UIPageControl = UIPageControl()
    private let pageIndicatorLabel: UILabel = {
       let label = UILabel()
        label.font = Theme.Font.subTitleFont
        label.textColor = .darkGray
        return label
    }()
    private let skipButton: UIButton = {
       let button = UIButton()
        button.setTitle(AppTextConstants.OnboardViewController.skipText, for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        setupInitialPage()
        setupPageControl()
        setupPageLabel()
        setupSkipButton()
    }
    
    private func setupInitialPage() {
        let firstOnboardVC = OnboardViewController(image: UIImage.onboardFirst, title: AppTextConstants.OnboardViewController.firstOnboardTitle, subTitle: AppTextConstants.OnboardViewController.firstOnboardSubTitle)
        firstOnboardVC.delegate = self
        
        let secondOnboardVC = OnboardViewController(image: UIImage.onboardSecond, title: AppTextConstants.OnboardViewController.secondOnboardTitle, subTitle: AppTextConstants.OnboardViewController.secondOnboardSubTitle)
        secondOnboardVC.delegate = self
        
        let thirdOnboardVC = OnboardViewController(image: UIImage.onboardThird, title: AppTextConstants.OnboardViewController.thirdOnboardTitle, subTitle: AppTextConstants.OnboardViewController.thirdOnboardSubTitle, isLastPage: true)
        thirdOnboardVC.delegate = self
        
        pages = [firstOnboardVC, secondOnboardVC, thirdOnboardVC]
        
        if let firstPage = pages.first {
            setViewControllers([firstPage], direction: .forward, animated: true)
        }
    }
    
    private func setupPageControl() {
        pageControl.currentPageIndicatorTintColor = .main
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPage = 0
        pageControl.isHidden = false
        pageControl.numberOfPages = pages.count
        self.view.addSubview(pageControl)
     
        
        pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        self.view.bringSubviewToFront(pageControl)
    }
    
    private func setupPageLabel() {
        pageIndicatorLabel.attributedText = configureLabelText(boldText: "1", normalText: "/3")
        self.view.addSubview(pageIndicatorLabel)
        
        pageIndicatorLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.equalToSuperview().offset(10)
        }
    }
    
    private func setupSkipButton() {
        self.view.addSubview(skipButton)
        skipButton.addTarget(self, action: #selector(skipButtonTapped(_:)), for: .touchUpInside)
        skipButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.right.equalToSuperview().offset(-10)
        }
    }
    
}


//MARK: - UIPageViewController DataSource/Delegate

extension WelcomeViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController), viewControllerIndex > 0 else { return nil }
        
        return pages[viewControllerIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController), viewControllerIndex < pages.count - 1 else { return nil }
        
        return pages[viewControllerIndex + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let visibleViewController = viewControllers?.first, let index = pages.firstIndex(of: visibleViewController) {
                pageControl.currentPage = index
                
                let boldText = "\(index + 1)"
                let normalText = "/3"
                pageIndicatorLabel.attributedText = configureLabelText(boldText: boldText, normalText: normalText)
            }
        }
    }
    
}
//MARK: - OnboardViewControllerDelegate
extension WelcomeViewController: OnboardViewControllerDelegate {
    func startButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
        let loginVC = LoginViewController()
        let navigationController = UINavigationController(rootViewController: loginVC)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true)
    }
}

//MARK: - Helper
extension WelcomeViewController {

    @objc private func skipButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
        let loginVC = LoginViewController()
        let navigationController = UINavigationController(rootViewController: loginVC)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true)
    }
}

