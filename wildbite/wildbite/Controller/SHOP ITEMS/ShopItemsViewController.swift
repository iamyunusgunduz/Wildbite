//
//  ShopItemsViewController.swift
//  wildbite
//
//  Created by Yunus Gündüz on 11.05.2023.
//

import UIKit

class ShopItemsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
       
        
        print("Shop id: \(UserDefaults.standard.integer(forKey: "ShopMenuID"))")
        print("Shop Name: \(UserDefaults.standard.string(forKey: "ShopMenuAD")!)")
       
    }

}
