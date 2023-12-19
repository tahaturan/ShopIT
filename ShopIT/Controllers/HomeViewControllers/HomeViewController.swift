//
//  HomeViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 18.12.2023.
//

import SnapKit
import UIKit

final class HomeViewController: UIViewController {
    // MARK: - Properties

    lazy var menuButton: UIButton = createNavButton(image: .menuIcon)
    lazy var notificationButton: UIButton = createNavButton(image: UIImage(systemName: "bell")!)
    let titleLabel: CustomLabel = CustomLabel(labelType: .title, text: AppTextConstants.HomeViewController.title)
    let subTitleLabel: CustomLabel = CustomLabel(labelType: .subTitle, text: AppTextConstants.HomeViewController.subTitle)
    let searchBarContainer: SearchBarContainer = SearchBarContainer()
    let categoryButton: CategoryListButtons = CategoryListButtons()
    let newArrivalTitleLabel: CustomLabel = CustomLabel(labelType: .title, text: "New Arrival")
    let seeAllLabel: CustomLabel = CustomLabel(labelType: .subTitle, text: "See All")

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchProduct()
    }
}

// MARK: - Setup UI/Layout

extension HomeViewController {
    private func setupUI() {
        view.backgroundColor = .viewBackround
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(searchBarContainer)
        view.addSubview(categoryButton)
        view.addSubview(newArrivalTitleLabel)
        view.addSubview(seeAllLabel)

        HomeViewLayout.setupLayout(for: self)
        HomeViewLayout.setupNavigationBar(for: self)
    }
}

// MARK: - Helper

extension HomeViewController {
    private func fetchProduct() {
        ProductService.shared.fetchProducts { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(products):
                    self.displayProducts(products)
                    print(products[0].title)
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }
        }
    }

    private func displayProducts(_ products: Product) {
    }
}

// MARK: - Factory

extension HomeViewController {
    private func createNavButton(image: UIImage) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .darkGray
        return button
    }
}
