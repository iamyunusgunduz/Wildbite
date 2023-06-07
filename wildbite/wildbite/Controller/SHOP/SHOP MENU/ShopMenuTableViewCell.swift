//
//  ShopMenuTableViewCell.swift
//  wildbite
//
//  Created by Yunus Gunduz on 11.04.2023.
//

import UIKit

class ShopMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var kategoriNameView: UIView!
    @IBOutlet weak var shopImageView: UIImageView!
    
    @IBOutlet weak var menuAdiLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        kategoriNameView.backgroundColor = UIColor(patternImage: UIImage(named: "Quest_Background.png")!)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        print("b")
    }

}
