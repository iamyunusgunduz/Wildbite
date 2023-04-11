//
//  ItemListAllTableViewCell.swift
//  wildbite
//
//  Created by Yunus Gunduz on 11.04.2023.
//

import UIKit

class ItemListAllTableViewCell: UITableViewCell {

    var itemInfo = [ItemListAllModel]()
    
    @IBOutlet weak var queryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artiLabel: UILabel!
    @IBOutlet weak var priceBuyLabel: UILabel!
    @IBOutlet weak var priceSellLabel: UILabel!
    @IBOutlet weak var dressLabel: UILabel!
   
    @IBOutlet weak var itemImageView: UIImageView!
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
