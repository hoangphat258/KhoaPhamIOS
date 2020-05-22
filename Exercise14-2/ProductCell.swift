//
//  ProductCell.swift
//  Exercise14-2
//
//  Created by Phat Ho Hoang on 5/22/20.
//  Copyright © 2020 Phat Ho Hoang. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lbProduct: UILabel!
    @IBOutlet weak var lbQuantity: UILabel!
    @IBOutlet weak var btnRemove: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbTotal: UILabel!
    @IBOutlet weak var btnDelete: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
