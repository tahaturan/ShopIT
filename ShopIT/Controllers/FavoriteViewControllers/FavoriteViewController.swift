//
//  FavoriteViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 18.12.2023.
//

import SnapKit
import UIKit

class FavoriteViewController: UIViewController {
    // MARK: - Properties

    private var favoriteItem: [FavoriteItem] = []
    private let realm: RealmService = RealmService()
    var collectionView: UICollectionView!
    let emptyViewImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .favoriteViewIcon
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        favoriteItem = realm.getFavoriteItems()
        setupCollectionView()
        setupUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
        updateView()
    }
}

// MARK: - Helper

extension FavoriteViewController {
    private func setupUI() {
        view.backgroundColor = .viewBackround
        updateView()
        FavoriteViewLayout.setupLayout(on: self)
        navigationItem.title = "Favorite"
        
    }

    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: AppTextConstants.CellIDs.homeCollectionViewID)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    private func updateUI() {
        favoriteItem = realm.getFavoriteItems()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    private func updateView() {
        UIView.animate(withDuration: 0.8) {
            if self.favoriteItem.isEmpty {
                self.emptyViewImage.alpha = 0.5
                self.collectionView.alpha = 0
            } else {
                self.emptyViewImage.alpha = 0
                self.collectionView.alpha = 1
            }
        }
    }
}

// MARK: - UICollectionView Delegate/DataSource/DelegateFlowLayout

extension FavoriteViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favoriteItem.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppTextConstants.CellIDs.homeCollectionViewID, for: indexPath) as! HomeCollectionViewCell
        let product = favoriteItem[indexPath.row]
        cell.setupFavorite(favoriteItem: product)
        cell.delegate = self
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}
//MARK: -
extension FavoriteViewController: HomeCollectionViewCellProtocol {
    
    func didTapFavoriteButton(in cell: HomeCollectionViewCell, sender: UIButton) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        let product = favoriteItem[indexPath.row]
        realm.removeProductFromFavorite(productId: product.productID)
        favoriteItem.remove(at: indexPath.row)
        
        collectionView.performBatchUpdates {
            collectionView.deleteItems(at: [indexPath])
        } completion: { _ in
            self.collectionView.reloadData()
        }
        collectionView.reloadData()
        updateView()
    }
}
