//
//  Product.swift
//  Exercise14-2
//
//  Created by Phat Ho Hoang on 5/22/20.
//  Copyright © 2020 Phat Ho Hoang. All rights reserved.
//

import Foundation

class Product{
    let name: String
    var price: Int
    var amount: Int
    let image: String
    
    init(name:String, price:Int, amount:Int, image:String) {
        self.name = name
        self.price = price
        self.amount = amount
        self.image = image
    }
}
