//
//  DressedItemsViewController.swift
//  wildbite
//
//  Created by Yunus Gündüz on 27.05.2023.
//

import UIKit
import Alamofire
import Kingfisher


class DressedItemsViewController: UIViewController {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemLevelLabel: UILabel!
    @IBOutlet weak var itemBuyPriceLabel: UILabel!
    @IBOutlet weak var itemSellPriceLabel: UILabel!
    @IBOutlet weak var itemDressLevelLabel: UILabel!
    @IBOutlet weak var itemPowerLabel: UILabel!
    @IBOutlet weak var itemDefenseLabel: UILabel!
    @IBOutlet weak var itemSpeedLabel: UILabel!
    @IBOutlet weak var itemHealthLabel: UILabel!
    
    
    
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background2.png")!)
    }
    override func viewWillAppear(_ animated: Bool) {
        loadUserDressedItems()
    }

    fileprivate func loadUserDressedItems() {
        let myUserID = UserDefaults.standard.value(forKey: "userID")
        let myUserName = UserDefaults.standard.value(forKey: "userName")
        let myUserToken = UserDefaults.standard.value(forKey: "userToken")
        print("User Id: \(myUserID!)")
        print("User Name: \(myUserName!)")
        print("User Token: \(myUserToken!)")
        
        let token = "\(myUserToken!)"
        
        let headers: HTTPHeaders = [
            
            .authorization(bearerToken: token),
            .accept("application/json")
            
        ]

        AF.request("http://yunusgunduz.site/wildbite/public/api/dressed-enemy/\(myUserID!))" , headers: headers )
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData { [self] response in
                
                
                switch response.result {
                    case .success:
                        print("dress list Successful")
                        let tiklananItem = UserDefaults.standard.string(forKey: "DressedItemTap")
                        let dressResponse = try? JSONDecoder().decode(UserDressedModel.self, from: response.data!)
                        debugPrint(dressResponse ?? "dress list bisey oldu")
                       
                        dump("Item + user pow\(dressResponse?.userPower ?? 0)")
                        dump("Item + user health\(dressResponse?.userCurrentHealth ?? 0)")
                        dump("Item + user def\(dressResponse?.userDefense ?? 0)")
                        dump("Item + user speed\(dressResponse?.userSpeed ?? 0)")
                       
                        dump("Only Item pow: \(dressResponse?.itemPower ?? 0)")
                        dump("Only Item health: \(dressResponse?.itemHealth ?? 0)")
                        dump("Only Item def: \(dressResponse?.itemDefense ?? 0) ")
                        dump("Only Item speed: \(dressResponse?.itemSpeed ?? 0)")
                      
                        dressResponse?.dressed.forEach({ itemler in
                            
                            if( itemler.level == "0"){     itemImageView.backgroundColor = UIColor.systemPurple }
                            if( itemler.level == "1"){     itemImageView.backgroundColor = UIColor.systemBlue }
                            if( itemler.level == "2"){     itemImageView.backgroundColor = UIColor.systemGreen }
                            if( itemler.level == "3"){     itemImageView.backgroundColor = UIColor.systemYellow }
                            if( itemler.level == "4"){     itemImageView.backgroundColor = UIColor.systemOrange }
                            if( itemler.level == "5"){     itemImageView.backgroundColor = UIColor.systemRed }
                            if( itemler.level == "6"){     itemImageView.backgroundColor = UIColor.systemRed }
                            switch itemler.shopName{
                                case "STANDART Ayakkabı Kasası":
                                    if(tiklananItem == "ayakkabi"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/ayakkabi/AyakkabiGold/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                   
                                case "PREMIUM Ayakkabı Kasası":
                                    if(tiklananItem == "ayakkabi"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/ayakkabi/AyakkabiDiamond/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                  
                                case "STANDART Eldiven Kasası":
                                    if(tiklananItem == "eldiven"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/eldiven/EldivenGold/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                   
                                case "PREMIUM Eldiven Kasası":
                                    if(tiklananItem == "eldiven"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/eldiven/EldivenDiamond/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                   
                                case "STANDART Kalkan Kasası":
                                    if(tiklananItem == "kalkan"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/kalkan/KalkanGold/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                   
                                case "PREMIUM Kalkan Kasası":
                                    if(tiklananItem == "kalkan"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/kalkan/KalkanDiamond/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                  
                                case "STANDART Kask Kasası":
                                    if(tiklananItem == "kask"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/kask/KaskGold/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                case "PREMIUM Kask Kasası":
                                    if(tiklananItem == "kask"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/kask/KaskDiamond/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                    
                                case "STANDART Kemer Kasası":
                                    if(tiklananItem == "kemer"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/kemer/KemerGold/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                    
                                    
                                    
                                case "PREMIUM Kemer Kasası":
                                    if(tiklananItem == "kemer"){
                                        let url =  URL(string: "https://yunusgunduz.site/wildbite/image/Items/kemer/KemerDiamond/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                    
                                case "STANDART Pantolon Kasası":
                                    if(tiklananItem == "pantolon"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/pantolon/PantolonGold/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                case "PREMIUM Pantolon Kasası":
                                    if(tiklananItem == "pantolon"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/pantolon/PantolonDiamond/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                    
                                case "STANDART Takı Kasası":
                                    if(tiklananItem == "taki"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/taki/TakiGold/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                case "PREMIUM Takı Kasası":
                                    if(tiklananItem == "taki"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/taki/TakiDiamond/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                    
                                case "STANDART Zırh Kasası":
                                    if(tiklananItem == "zirh"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/zirh/ZirhGold/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                case "PREMIUM Zırh Kasası":
                                    if(tiklananItem == "zirh"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/zirh/ZirhDiamond/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                    
                                case "STANDART Asa Kasası":
                                    if(tiklananItem == "silah"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/asa/AsaGold/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                case "PREMIUM Asa Kasası":
                                    if(tiklananItem == "silah"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/asa/AsaDiamond/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                    
                                case "STANDART Balta Kasası":
                                    if(tiklananItem == "silah"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/balta/BaltaGold/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                case "PREMIUM Balta Kasası":
                                    if(tiklananItem == "silah"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/balta/BaltaDiamond/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                    
                                case "STANDART Balyoz Kasası":
                                    if(tiklananItem == "silah"){
                                        let url =  URL(string: "https://yunusgunduz.site/wildbite/image/Items/balyoz/BalyozGold/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                case "PREMIUM Balyoz Kasası":
                                    if(tiklananItem == "silah"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/balyoz/BalyozDiamond/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                    
                                case "STANDART Kılıç Kasası":
                                    if(tiklananItem == "silah"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/kilic/KilicGold/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                case "PREMIUM Kılıç Kasası":
                                    if(tiklananItem == "silah"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/kilic/KilicDiamond/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                    
                                case "STANDART Mızrak Kasası":
                                    if(tiklananItem == "silah"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/mizrak/MizrakGold/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                case "PREMIUM Mızrak Kasası":
                                    if(tiklananItem == "silah"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/mizrak/MizrakDiamond/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                    
                                case "STANDART Yay/Arbalet Kasası":
                                    if(tiklananItem == "silah"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/yayArbalet/YayArbaletGold/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                case "PREMIUM Yay/Arbalet Kasası":
                                    if(tiklananItem == "silah"){
                                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/Items/yayArbalet/YayArbaletDiamond/\(itemler.image).png")!
                                        itemImageView.kf.setImage(with: url )
                                        itemNameLabel.text = "Name: \(itemler.name)"
                                        itemLevelLabel.text = "Level: +\(itemler.level)"
                                        if(itemler.priceType == "1"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) GOLD"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) GOLD"
                                        }
                                        if(itemler.priceType == "2"){
                                            itemBuyPriceLabel.text = "Buy Price: \(itemler.priceBuy) DIAMOND"
                                            itemSellPriceLabel.text = "Sell Price: \(itemler.priceSell) DIAMOND"
                                        }
                                        itemDressLevelLabel.text = "Dress Level: \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "Power: \(itemler.power)"
                                        itemDefenseLabel.text = "Defense: \(itemler.defense)"
                                        itemSpeedLabel.text = "Speed: \(itemler.speed)"
                                        itemHealthLabel.text = "Health: \(itemler.health)"
                                    }
                                default:
                                    break
                            }
                        })

                    case let .failure(error):
                        print(error.errorDescription!)
                        print("hata")
                }
            }
    }

}
