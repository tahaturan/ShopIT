//
//  WalletsViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 31.12.2023.
//

import UIKit

class WalletsViewController: UIViewController {
    //MARK: - Properties
    let titleLabel: CustomLabel = CustomLabel(labelType: .title, text: "My Wallets")
    let credidCartList: [CreditCartModel] = CreditCartModel.dummyCartList
    var cardCollectionView: UICollectionView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCardCollectionView()
    }
}
//MARK: - Helper
extension WalletsViewController {
    private func setupUI() {
        view.backgroundColor = .viewBackround
        WalletViewLayout.setupLayout(in: self)
    }
    private func setupCardCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 300, height: 190)
        layout.minimumLineSpacing = 30
        
        cardCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cardCollectionView.backgroundColor = .clear
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        cardCollectionView.showsHorizontalScrollIndicator = false
        cardCollectionView.register(CreditCardCollectionViewCell.self, forCellWithReuseIdentifier: AppTextConstants.CellIDs.creditCartCellID)
        view.addSubview(cardCollectionView)
        cardCollectionView.translatesAutoresizingMaskIntoConstraints = false
        cardCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            
            make.height.equalTo(200)
        }
    }
}
//MARK: - UICollectionView Delegate/DataSource
extension WalletsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return credidCartList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cardCollectionView.dequeueReusableCell(withReuseIdentifier: AppTextConstants.CellIDs.creditCartCellID, for: indexPath) as! CreditCardCollectionViewCell
        let cartModel = credidCartList[indexPath.row]
        cell.configureCell(in: cartModel)
        return cell
    }
}
