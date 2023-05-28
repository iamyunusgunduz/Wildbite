//
//  ShopMenuTableViewCell.swift
//  wildbite
//
//  Created by Yunus Gunduz on 11.04.2023.
//

import UIKit

class ShopMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var menuAdiLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func btnDelete(_ sender: Any) {
        print("a")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        print("b")
    }

}
