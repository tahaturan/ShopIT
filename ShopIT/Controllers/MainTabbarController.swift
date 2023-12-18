//
//  MainTabbarController.swift
//  ShopIT
//
//  Created by Taha Turan on 18.12.2023.
//

import UIKit

class MainTabbarController: UITabBarController, UITabBarControllerDelegate {
    //MARK: - Properties
   private let homeViewController: UIViewController = HomeViewController()
    private let basketViewContorller: UIViewController = BasketViewController()
    private let favoriteViewController: UIViewController = FavoriteViewController()
    private let profileViewController: UIViewController = ProfileViewController()
    private let selectionIndicator = UIView()

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
        setupSelectionIndicator()
        self.delegate = self
    }
    
    private func setupTabbar() {
        homeViewController.tabBarItem = UITabBarItem(title: "", image: .homeIcon.resize(to: Theme.Size.tabbarIconSize), selectedImage: .homeIcon.resize(to: Theme.Size.tabbarIconSize).withRenderingMode(.alwaysOriginal))
      
        basketViewContorller.tabBarItem = UITabBarItem(title: "", image: .shoppingCartIcon.resize(to: Theme.Size.tabbarIconSize), selectedImage: .shoppingCartIcon.resize(to: Theme.Size.tabbarIconSize).withRenderingMode(.alwaysOriginal))
        favoriteViewController.tabBarItem = UITabBarItem(title: "", image: .heartIcon.resize(to: Theme.Size.tabbarIconSize), selectedImage: .heartIcon.resize(to: Theme.Size.tabbarIconSize).withRenderingMode(.alwaysOriginal))
        profileViewController.tabBarItem = UITabBarItem(title: "", image: .userIcon.resize(to: Theme.Size.tabbarIconSize), selectedImage: .userIcon.resize(to: Theme.Size.tabbarIconSize).withRenderingMode(.alwaysOriginal))
        
        viewControllers = [homeViewController, basketViewContorller, favoriteViewController, profileViewController]
       
        tabBar.backgroundColor = .white
        
    }
  
    
    private func setupSelectionIndicator() {
        selectionIndicator.backgroundColor = .main
        selectionIndicator.frame = CGRect(x: 0, y: 0, width: 0, height: 2)
        tabBar.addSubview(selectionIndicator)
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        moveSelectionIndicator(to: viewController)
    }

    private func moveSelectionIndicator(to viewController: UIViewController) {
        if let index = viewControllers?.firstIndex(of: viewController) {
            
            let tabFrame = tabBar.subviews[index + 1].frame

            UIView.animate(withDuration: 0.3) {
                self.selectionIndicator.frame = CGRect(x: tabFrame.minX + 20, y: self.tabBar.frame.height - 42, width: tabFrame.width - 35, height: 1)
            }
        }
    }
}
