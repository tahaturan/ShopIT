//
//  WalletsViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 31.12.2023.
//

import UIKit

class WalletsViewController: UIViewController {
    //MARK: - Properties
    let titleLabel: CustomLabel = CustomLabel(labelType: .title, text: AppTextConstants.WalletsViewController.myWallets)
    let credidCartList: [CreditCartModel] = CreditCartModel.dummyCartList
    var cardCollectionView: UICollectionView!
    let recentLabel: UILabel = {
        let label = UILabel()
        label.font = Theme.Font.normalBoldFont
        label.textColor = .black
        label.text = AppTextConstants.WalletsViewController.recentTransactions
        return label
    }()
    var orderList: [OrderItem] = []
    let realmService = RealmService()
    var orderTableView: UITableView = UITableView()
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        orderList = realmService.getOrderItems()
        setupLayout()
    }
}
//MARK: - Helper
extension WalletsViewController {
    private func setupUI() {
        view.backgroundColor = .viewBackround
        view.addSubview(titleLabel)
        
        view.addSubview(recentLabel)
        view.addSubview(orderTableView)
        setupCardCollectionView()
        setupOrderTableView()
        
    }
    private func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalTo(view.snp.centerX)
        }
        cardCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(200)
        }
        recentLabel.snp.makeConstraints { make in
            make.top.equalTo(cardCollectionView.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(10)
        }
        orderTableView.snp.makeConstraints { make in
            make.top.equalTo(recentLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview()
        }
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
        cardCollectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cardCollectionView)
    }
    private func setupOrderTableView() {
        orderTableView.rowHeight = 110
        orderTableView.delegate = self
        orderTableView.dataSource = self
        orderTableView.register(OrderTableViewCell.self, forCellReuseIdentifier: AppTextConstants.CellIDs.orderTableViewCell)
        orderTableView.isEditing = false
        orderTableView.separatorStyle = .none
        orderTableView.backgroundColor = .viewBackround
        
        
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
//MARK: - UITableView  Delegate/DataSource
extension WalletsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = orderTableView.dequeueReusableCell(withIdentifier: AppTextConstants.CellIDs.orderTableViewCell, for: indexPath) as! OrderTableViewCell
        let order = orderList[indexPath.row]
        cell.configureCell(order: order)
        return cell
    }
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }

}
