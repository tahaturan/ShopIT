//
//  BasketViewController.swift
//  ShopIT
//
//  Created by Taha Turan on 18.12.2023.
//

import RealmSwift
import UIKit
class BasketViewController: UIViewController {
    // MARK: - Properties

    var cartItems: [CartItem] = []
    private let reamService = RealmService()
    let emptyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .shoppingBasket
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightGray
        return imageView
    }()

    let tableView: UITableView = UITableView()
    let subTotalLabel: UILabel = {
        let label = UILabel()
        label.text = AppTextConstants.BasketViewController.subtotal
        return label
    }()

    let totalPriceLabel = CustomLabel(labelType: .title, text: "")
    let cehckoutButton: PrimaryButton = PrimaryButton(title: AppTextConstants.BasketViewController.checkout)

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        cartItems = reamService.getCartItems()
        setupUI()
        setupTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartItems = reamService.getCartItems()
        updateView()
        configurePriceLabel()
        tableView.reloadData()
    }
}

// MARK: - Helper

extension BasketViewController {
    private func setupUI() {
        view.backgroundColor = .viewBackround
        navigationItem.title = AppTextConstants.BasketViewController.myCart
        updateView()
        BasketViewLayout.setupLayout(of: self)
        updateView()
    }

    private func updateView() {
        UIView.animate(withDuration: 0.8) {
            if self.cartItems.isEmpty {
                self.emptyImageView.alpha = 1 // Tamamen görünür yap
                self.tableView.alpha = 0 // Tamamen gizle
                self.subTotalLabel.alpha = 0
                self.totalPriceLabel.alpha = 0
                self.cehckoutButton.alpha = 0
            } else {
                self.emptyImageView.alpha = 0
                self.tableView.alpha = 1
                self.subTotalLabel.alpha = 1
                self.totalPriceLabel.alpha = 1
                self.cehckoutButton.alpha = 1
            }
        }
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BasketTableViewCell.self, forCellReuseIdentifier: AppTextConstants.CellIDs.basketTableViewID)
        tableView.rowHeight = 110
        tableView.backgroundColor = .viewBackround
    }

    private func configurePriceLabel() {
        var totalPrice = 0.0
        if cartItems.isEmpty {
        } else {
            for item in cartItems {
                totalPrice += item.price * Double(item.quantity)
            }
            totalPriceLabel.text = "$\(totalPrice)"
        }
    }
}

// MARK: - UITableView Delegate/DataSource

extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppTextConstants.CellIDs.basketTableViewID, for: indexPath) as! BasketTableViewCell
        let product = cartItems[indexPath.row]
        cell.delegate = self
        cell.configureCell(cartItem: product)
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, completionHandler in
            guard let self = self else { return }
            let itemToDelete = self.cartItems[indexPath.row]
            self.reamService.removeProdutcFromCart(cartItem: itemToDelete)
            self.cartItems.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .bottom)
            updateView()
            configurePriceLabel()
            completionHandler(true)
        }
        deleteAction.backgroundColor = .red

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])

        return configuration
    }
}

// MARK: - BasketTableViewCellProtocol

extension BasketViewController: BasketTableViewCellProtocol {
    func didTapAddButton(in cell: BasketTableViewCell, sender: UIButton) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let item = cartItems[indexPath.row]
        try! Realm().write({
            reamService.updateQuantity(for: item.productId, to: item.quantity + 1)
        })
        configurePriceLabel()
        tableView.reloadRows(at: [indexPath], with: .middle)
    }

    func didRemoveTapButton(in cell: BasketTableViewCell, sender: UIButton) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let item = cartItems[indexPath.row]

        try! Realm().write({
            reamService.updateQuantity(for: item.productId, to: item.quantity - 1)
        })
        configurePriceLabel()
        tableView.reloadRows(at: [indexPath], with: .left)
    }
}
