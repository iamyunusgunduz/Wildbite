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

        // Do any additional setup after loading the view.
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
                       
                        dump("Item + user pow\(dressResponse!.userPower)")
                        dump("Item + user health\(dressResponse!.userCurrentHealth)")
                        dump("Item + user def\(dressResponse!.userDefense)")
                        dump("Item + user speed\(dressResponse!.userSpeed)")
                       
                        dump("Only Item pow: \(dressResponse!.itemPower)")
                        dump("Only Item health: \(dressResponse!.itemHealth)")
                        dump("Only Item def: \(dressResponse!.itemDefense)")
                        dump("Only Item speed: \(dressResponse!.itemSpeed)")
                        
                        dressResponse?.dressed.forEach({ itemler in
                            switch itemler.shopName{
                                case "kask":
                                    if(tiklananItem == "kask"){
                                        let url = URL(string: itemler.image)!
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
                                   
                                case "zırh":
                                    if(tiklananItem == "zirh"){
                                        let url = URL(string: itemler.image)!
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
                                  
                                case "silah":
                                    if(tiklananItem == "silah"){
                                        let url = URL(string: itemler.image)!
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
                                   
                                case "kalkan":
                                    if(tiklananItem == "kalkan"){
                                        let url = URL(string: itemler.image)!
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
                                   
                                case "kolye":
                                    if(tiklananItem == "kolye"){
                                        let url = URL(string: itemler.image)!
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
                                   
                                case "eldiven":
                                    if(tiklananItem == "eldiven"){
                                        let url = URL(string: itemler.image)!
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
                                  
                                case "bot":
                                    if(tiklananItem == "ayakkabi"){
                                        let url = URL(string: itemler.image)!
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
