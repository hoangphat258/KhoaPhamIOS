//
//  ViewController.swift
//  Exercise14-2
//
//  Created by Phat Ho Hoang on 5/22/20.
//  Copyright © 2020 Phat Ho Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    @IBOutlet weak var lbTotal: UILabel!
    @IBOutlet weak var tableViewProduct: UITableView!
    
    var products: [Product] = [Product(name: "iPhone 11 Pro Max", price: 999, amount: 0, image: "iphone_11_pro_max"),
                               Product(name: "iPhone 11", price: 699, amount: 0, image: "iphone_11"),
                               Product(name: "iPhone Xr", price: 599, amount: 0, image: "iphone_xr"),
                               Product(name: "iPhone Xs Max", price: 899, amount: 0, image: "iphone_xs_max"),
                               Product(name: "iPhone 11 Pro Max", price: 999, amount: 0, image: "iphone_11_pro_max"),
                               Product(name: "iPhone 11", price: 699, amount: 0, image: "iphone_11"),
                               Product(name: "iPhone Xr", price: 599, amount: 0, image: "iphone_xr"),
                               Product(name: "iPhone Xs Max", price: 899, amount: 0, image: "iphone_xs_max")]
    var total = 0
    var totalOfProduct = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableViewProduct.delegate = self
        tableViewProduct.dataSource = self
        lbTotal.text = String(total)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewProduct.dequeueReusableCell(withIdentifier: "cell") as! ProductCell
        cell.lbProduct.text = products[indexPath.row].name
        cell.lbPrice.text = String(products[indexPath.row].price)
        cell.imgProduct.image = UIImage(named: products[indexPath.row].image)
        cell.lbQuantity.text = String(products[indexPath.row].amount)
        totalOfProduct = products[indexPath.row].amount * products[indexPath.row].price
        cell.lbTotal.text = String(totalOfProduct)
        buttonHandler(cell: cell, indexPath: indexPath)
        return cell
    }
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 400
    //    }
    
    func buttonHandler(cell: ProductCell, indexPath: IndexPath){
        cell.btnAdd.tag = indexPath.row
        cell.btnRemove.tag = indexPath.row
        cell.btnDelete.tag = indexPath.row
        cell.btnAdd.addTarget(self, action: #selector(addAmount(sender:)), for: .touchUpInside)
        cell.btnRemove.addTarget(self, action: #selector(removeAmount(sender:)), for: .touchUpInside)
        cell.btnDelete.addTarget(self, action: #selector(deleteProduct(sender:)), for: .touchUpInside)
    }
    
}

extension ViewController{
    @objc func addAmount(sender: UIButton){
        products[sender.tag].amount += 1
        tableViewProduct.reloadData()
        totalOfProducts()
    }
    
    @objc func removeAmount(sender: UIButton){
        products[sender.tag].amount -= 1
        if products[sender.tag].amount < 0 {
            products[sender.tag].amount = 0
            alertAmount()
        }
        tableViewProduct.reloadData()
        totalOfProducts()
    }
    
    @objc func deleteProduct(sender: UIButton){
        print(sender.tag)
        products.remove(at: sender.tag)
        totalOfProducts()
        tableViewProduct.reloadData()
    }
    
    func alertAmount(){
        let alert = UIAlertController(title: "Error", message: "The amount must be greater than or equal to 0.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func totalOfProducts(){
        total = 0
        for i in 0..<products.count{
            total += products[i].amount * products[i].price
        }
        lbTotal.text = String(total)
    }
}
