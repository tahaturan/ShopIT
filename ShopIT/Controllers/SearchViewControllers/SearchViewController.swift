//
//  SearchViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 20.12.2023.
//

import UIKit

final class SearchViewController: UIViewController {
    //MARK: - Propeties
     let searchBar: UISearchBar = {
       let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.showsCancelButton = true
        searchBar.placeholder = AppTextConstants.HomeViewController.search
        return searchBar
    }()
    let recentSearchLabel: UILabel = {
       let label = UILabel()
        label.text = "Recent searches"
        label.font = Theme.Font.normalBoldFont
        return label
    }()
    let recentButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        button.tintColor = .black
        return button
    }()
    let dividerView: UIView = {
        let dividerView = UIView()
        dividerView.backgroundColor = .lightGray.withAlphaComponent(0.5)
            return dividerView
    }()
    let showResultLabel: UILabel = {
       let label = UILabel()
        label.text = "Search results showing for ''"
        label.font = Theme.Font.normalBoldFont
        return label
    }()
    var collectionView: UICollectionView!
    private var products: [ProductElement] = []
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchProduct()
        searchBar.delegate = self
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
}
//MARK: - Helper
extension SearchViewController {
    private func setupUI() {
        view.backgroundColor = .viewBackround
        view.addSubview(searchBar)
        view.addSubview(recentSearchLabel)
        searchBar.becomeFirstResponder()
        view.addSubview(recentButton)
        view.addSubview(dividerView)
        view.addSubview(showResultLabel)
        setupCollectionView()
        view.addSubview(collectionView)
        SearchViewLayout.setupLayout(for: self)
    }
    
    private func fetchProduct() {
        let request = ProductRequest()
        request.perform { [weak self] result in
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
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: AppTextConstants.CellIDs.homeCollectionViewID)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func updateUI() {
        collectionView.reloadData()
    }
    private func displayError(_ error: Error) {
        
    }
}

//MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // arama islemi
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationController?.popViewController(animated: true)
        
    }
}

//MARK: - UICollectionView Delegate/DataSource
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
}
