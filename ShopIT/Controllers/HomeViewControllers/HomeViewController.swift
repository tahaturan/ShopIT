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
    
    var products: [ProductElement] = []
    
    var collectionView: UICollectionView!
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
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
        view.addSubview(collectionView)
        HomeViewLayout.setupLayout(for: self)
        HomeViewLayout.setupNavigationBar(for: self)
    }
}

// MARK: - Helper

extension HomeViewController {
    private func fetchProduct() {
        let request = ProductRequest(category: .jewelery)
        request.perform {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedProducts):
                    self?.products = fetchedProducts
                    self?.updateUI()
                case .failure(let error):
                    self?.displayError(error)
                }
            }
        }
    }
    private func updateUI() {
        collectionView.reloadData()
    }
    private func displayError(_ error: Error) {
        
    }
  
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: AppTextConstants.CellIDs.homeCollectionViewID)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: - Factory Methods

extension HomeViewController {
    private func createNavButton(image: UIImage) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .darkGray
        return button
    }
}

//MARK: - UICollectionView Delegate/DataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppTextConstants.CellIDs.homeCollectionViewID, for: indexPath) as! HomeCollectionViewCell
        let product = products[indexPath.row]
        cell.setupViews(product: product)
        return cell
    }
}
//MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}
