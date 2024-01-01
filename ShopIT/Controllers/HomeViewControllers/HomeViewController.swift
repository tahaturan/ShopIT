//
//  HomeViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 18.12.2023.
//

import SnapKit
import UIKit

protocol HomeViewMenuProtocol {
    func didTabMenuButton()
}

 class HomeViewController: UIViewController {
    // MARK: - Properties

    lazy var menuButton: UIButton = createNavButton(image: .menuIcon)
    lazy var notificationButton: UIButton = createNavButton(image: UIImage(systemName: "bell")!)
    let titleLabel: CustomLabel = CustomLabel(labelType: .title, text: AppTextConstants.HomeViewController.title)
    let subTitleLabel: CustomLabel = CustomLabel(labelType: .subTitle, text: AppTextConstants.HomeViewController.subTitle)
    let searchBarContainer: SearchBarContainer = SearchBarContainer()
    let categoryButton: CategoryListButtons = CategoryListButtons()
    let newArrivalTitleLabel: CustomLabel = CustomLabel(labelType: .title, text: AppTextConstants.FilterViewController.newArrival)
    let seeAllLabel: CustomLabel = CustomLabel(labelType: .subTitle, text: AppTextConstants.HomeViewController.seeAll)

    var products: [ProductElement] = []
    private let realm: RealmService = RealmService()
    var collectionView: UICollectionView!
    var delegate: HomeViewMenuProtocol?
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupUI()
        fetchProduct()
        searchBarContainer.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.updateUI()
            self.navigationController?.isNavigationBarHidden = false
        }
    }
}

// MARK: - Setup UI/Layout

extension HomeViewController {
    private func setupUI() {
        
        HomeViewLayout.setupLayout(for: self)
        HomeViewLayout.setupNavigationBar(for: self)
        menuButton.addTarget(self, action: #selector(menuButtonTapped(_:)), for: .touchUpInside)
    }
}

// MARK: - Helper

extension HomeViewController {
    private func fetchProduct() {
        let request = ProductRequest(category: .jewelery)
        request.perform { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case let .success(fetchedProducts):
                    self?.products = fetchedProducts
                    self?.updateUI()
                case let .failure(error):
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

    private func isProductFavorited(productId: Int) -> Bool {
        let favoriteItems = realm.getFavoriteItems()
        return favoriteItems.contains(where: { $0.productID == productId })
    }


    @objc private func menuButtonTapped(_ sender: UIButton) {
        delegate?.didTabMenuButton()
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

// MARK: - UICollectionView Delegate/DataSource

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppTextConstants.CellIDs.homeCollectionViewID, for: indexPath) as! HomeCollectionViewCell
        let product = products[indexPath.row]
        let isProductFavorited = isProductFavorited(productId: product.id)
        cell.isFavorite = isProductFavorited
        cell.delegate = self
        cell.setupViews(product: product)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        let detailViewController = DetailViewController()
        detailViewController.product = product
        detailViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
}

// MARK: - HomeCollectionViewCellProtocol

extension HomeViewController: HomeCollectionViewCellProtocol {
    func didTapFavoriteButton(in cell: HomeCollectionViewCell, sender: UIButton) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        let product = products[indexPath.row]

        let isFavorited = isProductFavorited(productId: product.id)
        if isFavorited {
            realm.removeProductFromFavorite(productId: product.id)
        } else {
            realm.addProductToFavorite(product: product)
        }
        cell.isFavorite = !cell.isFavorite
        collectionView.reloadItems(at: [indexPath])
    }
}

// MARK: - SearchBarContainerDelegate

extension HomeViewController: SearchBarContainerDelegate {
    func filterButtonWasTapped() {
        let filterViewController = FilterViewController()

        filterViewController.modalPresentationStyle = .pageSheet

        if let sheetController = filterViewController.sheetPresentationController {
            sheetController.detents = [.custom(resolver: { _ in

                self.view.frame.height * 0.65
            })]
            sheetController.preferredCornerRadius = 30
        }

        present(filterViewController, animated: true)
    }

    func searchBarDidBeginEditing() {
        let searchViewController = SearchViewController()
        searchViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(searchViewController, animated: true)
    }
}
