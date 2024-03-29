//
//  ContainerViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 29.12.2023.
//

import UIKit

class ContainerViewController: UIViewController, HomeViewMenuProtocol {
    private var mainTabBarController: MainTabbarController!
    private var menuViewController: MenuViewController!

    // Küçültme işlemi için gerekli özellikler
    private var isMenuOpen = false
    private let menuWidth: CGFloat = 250 // Menü genişliği
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMainTabBarController()

        setupMenuViewController()
    }

    private func setupMainTabBarController() {
        mainTabBarController = MainTabbarController()
        addChild(mainTabBarController)
        view.addSubview(mainTabBarController.view)
        mainTabBarController.didMove(toParent: self)

        if let homeVC = mainTabBarController.viewControllers?[0].children.first as? HomeViewController {
            homeVC.delegate = self
        }
    }

    private func setupMenuViewController() {
        menuViewController = MenuViewController()
        addChild(menuViewController)
        view.insertSubview(menuViewController.view, at: 0)
        menuViewController.didMove(toParent: self)
        menuViewController.delegate = self
    }

    func toggleMenu() {
        isMenuOpen = !isMenuOpen
        let scale: CGFloat = isMenuOpen ? 0.7 : 1.0
        let xOffset: CGFloat = isMenuOpen ? menuWidth : 0

        UIView.animate(withDuration: 0.5) {
            self.mainTabBarController.view.transform = CGAffineTransform(scaleX: scale, y: scale)
            self.mainTabBarController.view.frame.origin.x = xOffset
        }
    }

    func didTabMenuButton() {
        toggleMenu()
    }
}

// MARK: - MenuViewControllerDelegate

extension ContainerViewController: MenuViewControllerDelegate {
    func didSelectMenuItem(tag: Int) {
        toggleMenu()
        switch tag {
        case 1:
            mainTabBarController.selectedIndex = 2
        case 2:
            let walletVC = WalletsViewController()
            if let navController = mainTabBarController.selectedViewController as? UINavigationController {
                navController.isNavigationBarHidden = true
                navController.pushViewController(walletVC, animated: true)
            }
        case 6:
            let settingsVC = SettingsViewController()
            if let navController = mainTabBarController.selectedViewController as? UINavigationController {
                navController.isNavigationBarHidden = true
                navController.pushViewController(settingsVC, animated: true)
            }
        default:
           print("hazirlanmadi")
        }
    }
}
