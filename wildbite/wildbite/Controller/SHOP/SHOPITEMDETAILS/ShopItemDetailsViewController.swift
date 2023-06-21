//
//  ShopItemDetailsViewController.swift
//  wildbite
//
//  Created by Yunus Gündüz on 28.05.2023.
//

import UIKit
import Alamofire
import Kingfisher

class ShopItemDetailsViewController: UIViewController {
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemLevelLabel: UILabel!
    @IBOutlet weak var itemDressLevelLabel: UILabel!
    @IBOutlet weak var itemPowerLabel: UILabel!
    @IBOutlet weak var itemDefenseLabel: UILabel!
    @IBOutlet weak var itemSpeedLabel: UILabel!
    @IBOutlet weak var itemHealthLabel: UILabel!
    
    @IBOutlet weak var kasaItemNameLabel: UILabel!
    @IBOutlet weak var kasaItemLevelLabel: UILabel!
    @IBOutlet weak var kasaItemDressLevelLabel: UILabel!
    @IBOutlet weak var kasaItemPowerLabel: UILabel!
    @IBOutlet weak var kasaItemDefenseLabel: UILabel!
    @IBOutlet weak var kasaItemSpeedLabel: UILabel!
    @IBOutlet weak var kasaItemHealthLabel: UILabel!
    
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var kasaItemImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let itemResimAdiUD = UserDefaults.standard.array(forKey: "itemCekilisiItemResimleri")
        let itemItemAdiUD = UserDefaults.standard.array(forKey: "itemCekilisiItemAdi")
        let itemItemID = UserDefaults.standard.array(forKey: "itemCekilisiItemID")
        
        let itemItemDressLevelUD = UserDefaults.standard.array(forKey: "itemCekilisiItemDressLevel")
        let itemItemLevelUD = UserDefaults.standard.array(forKey: "itemCekilisiItemLevel")
        let itemItemPowerUD = UserDefaults.standard.array(forKey: "itemCekilisiItemPower")
        let itemItemDefenseUD = UserDefaults.standard.array(forKey: "itemCekilisiItemDefense")
        let itemItemSpeedUD = UserDefaults.standard.array(forKey: "itemCekilisiItemSpeed")
        let itemItemHealthUD = UserDefaults.standard.array(forKey: "itemCekilisiItemHealth")
        let itemItemRandomNumberUD = UserDefaults.standard.integer(forKey: "itemCekilisiRandomNumber")
        let KasadanCikanItemImageURL = UserDefaults.standard.url(forKey: "KasadanCikanItemImageURL")
        let url = KasadanCikanItemImageURL!
        kasaItemImageView.kf.setImage(with: url )
        kasaItemDressLevelLabel.text = (itemItemDressLevelUD![itemItemRandomNumberUD] as! String)
        kasaItemNameLabel.text = (itemItemAdiUD![itemItemRandomNumberUD] as! String)
        kasaItemLevelLabel.text = "+\((itemItemLevelUD![itemItemRandomNumberUD] as! String))"
        kasaItemPowerLabel.text = (itemItemPowerUD![itemItemRandomNumberUD] as! String)
        kasaItemDefenseLabel.text = (itemItemDefenseUD![itemItemRandomNumberUD] as! String)
        kasaItemSpeedLabel.text = (itemItemSpeedUD![itemItemRandomNumberUD] as! String)
        kasaItemHealthLabel.text = (itemItemHealthUD![itemItemRandomNumberUD] as! String)
        loadUserDressedItems()
    }
    
    @IBAction func itemKusan(_ sender: Any) {
        let shopID = UserDefaults.standard.integer(forKey: "ShopMenuID")
        let itemItemID = UserDefaults.standard.array(forKey: "itemCekilisiItemID")
        let itemItemRandomNumberUD = UserDefaults.standard.integer(forKey: "itemCekilisiRandomNumber")
        let usertoken = UserDefaults.standard.string(forKey: "userToken")
        dump("Debug: Kuşanılan item = { shop id : \(shopID)   item id: \(itemItemID?[itemItemRandomNumberUD] ?? 0) }")
        
        
        let headers: HTTPHeaders = [
            .authorization(bearerToken: usertoken!),
            .accept("application/json")
        ]
        let itemGiyParameters =
        
        AF.request("http://backhub.site/wildbite/public/api/dressed?shop_id=\(shopID)&item_id=\(itemItemID?[itemItemRandomNumberUD] ?? 0)",
                   method: .post,
                   headers: headers)
        .validate(statusCode: 200..<500)
        .validate(contentType: ["application/json"])
        .responseData {  response in
            debugPrint(response)
            switch response.result {
                case .success:
                    let itemGiyresponse = try? JSONDecoder().decode(ItemGiyModel.self,  from: response.data!)
                    debugPrint(itemGiyresponse ??  "bisey oldu itemGiyresponse")
                    dump("Debug: Message = \(itemGiyresponse?.message ?? "bisey oldu itemGiyresponse")")
                    if(itemGiyresponse?.message == "Kuşanıldı"){
                        self.viewWillAppear(true)
                    }
                    
                case let .failure(error):
                    print(error.errorDescription!)
                    print("hata")
            }
        }
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
        
        AF.request("http://backhub.site/wildbite/public/api/dressed-enemy/\(myUserID!))" , headers: headers )
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData { [self] response in
                
                
                switch response.result {
                    case .success:
                        print("dress list Successful")
                        print("Shop Name: \(UserDefaults.standard.string(forKey: "ShopMenuAD")!)")
                        let tiklananItem = UserDefaults.standard.string(forKey: "ShopMenuAD")!
                        let dressResponse = try? JSONDecoder().decode(UserDressedModel.self, from: response.data!)
                        debugPrint(dressResponse ?? "dress list bisey oldu")
                        
                        dump("Item + user pow\(dressResponse?.userPower ?? 0)")
                        dump("Item + user health\(dressResponse?.userCurrentHealth ?? 0)")
                        dump("Item + user def\(dressResponse?.userDefense ?? 0)")
                        dump("Item + user speed\(dressResponse?.userSpeed ?? 0)")
                        
                        dump("Only Item pow: \(dressResponse?.itemPower ?? 0)")
                        dump("Only Item health: \(dressResponse?.itemHealth ?? 0)")
                        dump("Only Item def: \(dressResponse?.itemDefense ?? 0)")
                        dump("Only Item speed: \(dressResponse?.itemSpeed ?? 0)")
                        /*
                         itemNameLabel
                         itemLevelLabel
                         itemDressLevelLabel
                         itemPowerLabel
                         itemDefenseLabel
                         itemSpeedLabel
                         itemHealthLabel
                         */
                        let marketitemlistStruct = MarketItemKategoriList()
                        dressResponse?.dressed.forEach({ itemler in
                            
                            
                            switch itemler.shopName{
                                case marketitemlistStruct.StAyakkabi:
                                    if(tiklananItem == marketitemlistStruct.StAyakkabi || tiklananItem == marketitemlistStruct.PrAyakkabi ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/ayakkabi/AyakkabiGold/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                    
                                case marketitemlistStruct.PrAyakkabi:
                                    if(tiklananItem == marketitemlistStruct.StAyakkabi || tiklananItem == marketitemlistStruct.PrAyakkabi ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/ayakkabi/AyakkabiDiamond/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.StEldiven:
                                    if(tiklananItem == marketitemlistStruct.StEldiven || tiklananItem == marketitemlistStruct.PrEldiven ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/eldiven/EldivenGold/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.PrEldiven:
                                    if(tiklananItem == marketitemlistStruct.StEldiven || tiklananItem == marketitemlistStruct.PrEldiven ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/eldiven/EldivenDiamond/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.StKalkan:
                                    if(tiklananItem == marketitemlistStruct.StKalkan || tiklananItem == marketitemlistStruct.PrKalkan){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/kalkan/KalkanGold/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.PrKalkan:
                                    if(tiklananItem == marketitemlistStruct.StKalkan || tiklananItem == marketitemlistStruct.PrKalkan){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/kalkan/KalkanDiamond/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.StKask:
                                    if(tiklananItem == marketitemlistStruct.StKask || tiklananItem == marketitemlistStruct.PrKask ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/kask/KaskGold/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.PrKask:
                                    if(tiklananItem == marketitemlistStruct.StKask || tiklananItem == marketitemlistStruct.PrKask ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/kask/KaskDiamond/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.StKemer:
                                    if(tiklananItem == marketitemlistStruct.StKemer || tiklananItem == marketitemlistStruct.PrKemer){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/kemer/KemerGold/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.PrKemer:
                                    if(tiklananItem == marketitemlistStruct.StKemer || tiklananItem == marketitemlistStruct.PrKemer){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/kemer/KemerDiamond/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.StPantolon:
                                    if(tiklananItem == marketitemlistStruct.StPantolon || tiklananItem == marketitemlistStruct.PrPantolon ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/pantolon/PantolonGold/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.PrPantolon:
                                    if(tiklananItem == marketitemlistStruct.StPantolon || tiklananItem == marketitemlistStruct.PrPantolon ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/pantolon/PantolonDiamond/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.StTaki:
                                    if(tiklananItem == marketitemlistStruct.StTaki || tiklananItem == marketitemlistStruct.PrTaki ){
                                        let urlImage = URL(string:
                                                            "https://backhub.site/wildbite/image/Items/taki/TakiGold/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.PrTaki:
                                    if(tiklananItem == marketitemlistStruct.StTaki || tiklananItem == marketitemlistStruct.PrTaki ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/taki/TakiDiamond/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.StZirh:
                                    if(tiklananItem == marketitemlistStruct.StZirh || tiklananItem == marketitemlistStruct.PrZirh ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/zirh/ZirhGold/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.PrZirh:
                                    if(tiklananItem == marketitemlistStruct.StZirh || tiklananItem == marketitemlistStruct.PrZirh ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/zirh/ZirhDiamond/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.StAsa:
                                    if(tiklananItem == marketitemlistStruct.StYayArbalet || tiklananItem == marketitemlistStruct.PrYayArbalet || tiklananItem == marketitemlistStruct.StMizrak  || tiklananItem == marketitemlistStruct.PrMizrak || tiklananItem == marketitemlistStruct.StKilic || tiklananItem == marketitemlistStruct.PrKilic  || tiklananItem == marketitemlistStruct.StBalyoz || tiklananItem == marketitemlistStruct.PrBalyoz || tiklananItem == marketitemlistStruct.StBalta || tiklananItem == marketitemlistStruct.PrBalta  || tiklananItem == marketitemlistStruct.StAsa || tiklananItem == marketitemlistStruct.PrAsa  ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/asa/AsaGold/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.PrAsa:
                                    if(tiklananItem == marketitemlistStruct.StYayArbalet || tiklananItem == marketitemlistStruct.PrYayArbalet || tiklananItem == marketitemlistStruct.StMizrak  || tiklananItem == marketitemlistStruct.PrMizrak || tiklananItem == marketitemlistStruct.StKilic || tiklananItem == marketitemlistStruct.PrKilic  || tiklananItem == marketitemlistStruct.StBalyoz || tiklananItem == marketitemlistStruct.PrBalyoz || tiklananItem == marketitemlistStruct.StBalta || tiklananItem == marketitemlistStruct.PrBalta  || tiklananItem == marketitemlistStruct.StAsa || tiklananItem == marketitemlistStruct.PrAsa  ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/asa/AsaDiamond/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.StBalta:
                                    if(tiklananItem == marketitemlistStruct.StYayArbalet || tiklananItem == marketitemlistStruct.PrYayArbalet || tiklananItem == marketitemlistStruct.StMizrak  || tiklananItem == marketitemlistStruct.PrMizrak || tiklananItem == marketitemlistStruct.StKilic || tiklananItem == marketitemlistStruct.PrKilic  || tiklananItem == marketitemlistStruct.StBalyoz || tiklananItem == marketitemlistStruct.PrBalyoz || tiklananItem == marketitemlistStruct.StBalta || tiklananItem == marketitemlistStruct.PrBalta  || tiklananItem == marketitemlistStruct.StAsa || tiklananItem == marketitemlistStruct.PrAsa  ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/balta/BaltaGold/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.PrBalta:
                                    if(tiklananItem == marketitemlistStruct.StYayArbalet || tiklananItem == marketitemlistStruct.PrYayArbalet || tiklananItem == marketitemlistStruct.StMizrak  || tiklananItem == marketitemlistStruct.PrMizrak || tiklananItem == marketitemlistStruct.StKilic || tiklananItem == marketitemlistStruct.PrKilic  || tiklananItem == marketitemlistStruct.StBalyoz || tiklananItem == marketitemlistStruct.PrBalyoz || tiklananItem == marketitemlistStruct.StBalta || tiklananItem == marketitemlistStruct.PrBalta  || tiklananItem == marketitemlistStruct.StAsa || tiklananItem == marketitemlistStruct.PrAsa  ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/balta/BaltaDiamond/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.StBalyoz:
                                    if(tiklananItem == marketitemlistStruct.StYayArbalet || tiklananItem == marketitemlistStruct.PrYayArbalet || tiklananItem == marketitemlistStruct.StMizrak  || tiklananItem == marketitemlistStruct.PrMizrak || tiklananItem == marketitemlistStruct.StKilic || tiklananItem == marketitemlistStruct.PrKilic  || tiklananItem == marketitemlistStruct.StBalyoz || tiklananItem == marketitemlistStruct.PrBalyoz || tiklananItem == marketitemlistStruct.StBalta || tiklananItem == marketitemlistStruct.PrBalta  || tiklananItem == marketitemlistStruct.StAsa || tiklananItem == marketitemlistStruct.PrAsa  ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/balyoz/BalyozGold/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.PrBalyoz:
                                    if(tiklananItem == marketitemlistStruct.StYayArbalet || tiklananItem == marketitemlistStruct.PrYayArbalet || tiklananItem == marketitemlistStruct.StMizrak  || tiklananItem == marketitemlistStruct.PrMizrak || tiklananItem == marketitemlistStruct.StKilic || tiklananItem == marketitemlistStruct.PrKilic  || tiklananItem == marketitemlistStruct.StBalyoz || tiklananItem == marketitemlistStruct.PrBalyoz || tiklananItem == marketitemlistStruct.StBalta || tiklananItem == marketitemlistStruct.PrBalta  || tiklananItem == marketitemlistStruct.StAsa || tiklananItem == marketitemlistStruct.PrAsa  ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/balyoz/BalyozDiamond/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.StKilic:
                                    if(tiklananItem == marketitemlistStruct.StYayArbalet || tiklananItem == marketitemlistStruct.PrYayArbalet || tiklananItem == marketitemlistStruct.StMizrak  || tiklananItem == marketitemlistStruct.PrMizrak || tiklananItem == marketitemlistStruct.StKilic || tiklananItem == marketitemlistStruct.PrKilic  || tiklananItem == marketitemlistStruct.StBalyoz || tiklananItem == marketitemlistStruct.PrBalyoz || tiklananItem == marketitemlistStruct.StBalta || tiklananItem == marketitemlistStruct.PrBalta  || tiklananItem == marketitemlistStruct.StAsa || tiklananItem == marketitemlistStruct.PrAsa  ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/kilic/KilicGold/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.PrKilic:
                                    if(tiklananItem == marketitemlistStruct.StYayArbalet || tiklananItem == marketitemlistStruct.PrYayArbalet || tiklananItem == marketitemlistStruct.StMizrak  || tiklananItem == marketitemlistStruct.PrMizrak || tiklananItem == marketitemlistStruct.StKilic || tiklananItem == marketitemlistStruct.PrKilic  || tiklananItem == marketitemlistStruct.StBalyoz || tiklananItem == marketitemlistStruct.PrBalyoz || tiklananItem == marketitemlistStruct.StBalta || tiklananItem == marketitemlistStruct.PrBalta  || tiklananItem == marketitemlistStruct.StAsa || tiklananItem == marketitemlistStruct.PrAsa  ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/kilic/KilicDiamond/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.StMizrak:
                                    if(tiklananItem == marketitemlistStruct.StYayArbalet || tiklananItem == marketitemlistStruct.PrYayArbalet || tiklananItem == marketitemlistStruct.StMizrak  || tiklananItem == marketitemlistStruct.PrMizrak || tiklananItem == marketitemlistStruct.StKilic || tiklananItem == marketitemlistStruct.PrKilic  || tiklananItem == marketitemlistStruct.StBalyoz || tiklananItem == marketitemlistStruct.PrBalyoz || tiklananItem == marketitemlistStruct.StBalta || tiklananItem == marketitemlistStruct.PrBalta  || tiklananItem == marketitemlistStruct.StAsa || tiklananItem == marketitemlistStruct.PrAsa  ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/mizrak/MizrakGold/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.PrMizrak:
                                    if(tiklananItem == marketitemlistStruct.StYayArbalet || tiklananItem == marketitemlistStruct.PrYayArbalet || tiklananItem == marketitemlistStruct.StMizrak  || tiklananItem == marketitemlistStruct.PrMizrak || tiklananItem == marketitemlistStruct.StKilic || tiklananItem == marketitemlistStruct.PrKilic  || tiklananItem == marketitemlistStruct.StBalyoz || tiklananItem == marketitemlistStruct.PrBalyoz || tiklananItem == marketitemlistStruct.StBalta || tiklananItem == marketitemlistStruct.PrBalta  || tiklananItem == marketitemlistStruct.StAsa || tiklananItem == marketitemlistStruct.PrAsa  ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/mizrak/MizrakDiamond/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                case marketitemlistStruct.StYayArbalet:
                                    if(tiklananItem == marketitemlistStruct.StYayArbalet || tiklananItem == marketitemlistStruct.PrYayArbalet || tiklananItem == marketitemlistStruct.StMizrak  || tiklananItem == marketitemlistStruct.PrMizrak || tiklananItem == marketitemlistStruct.StKilic || tiklananItem == marketitemlistStruct.PrKilic  || tiklananItem == marketitemlistStruct.StBalyoz || tiklananItem == marketitemlistStruct.PrBalyoz || tiklananItem == marketitemlistStruct.StBalta || tiklananItem == marketitemlistStruct.PrBalta  || tiklananItem == marketitemlistStruct.StAsa || tiklananItem == marketitemlistStruct.PrAsa  ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/yayArbalet/YayArbaletGold/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                    }
                                    
                                case marketitemlistStruct.PrYayArbalet:
                                    if(tiklananItem == marketitemlistStruct.StYayArbalet || tiklananItem == marketitemlistStruct.PrYayArbalet || tiklananItem == marketitemlistStruct.StMizrak  || tiklananItem == marketitemlistStruct.PrMizrak || tiklananItem == marketitemlistStruct.StKilic || tiklananItem == marketitemlistStruct.PrKilic  || tiklananItem == marketitemlistStruct.StBalyoz || tiklananItem == marketitemlistStruct.PrBalyoz || tiklananItem == marketitemlistStruct.StBalta || tiklananItem == marketitemlistStruct.PrBalta  || tiklananItem == marketitemlistStruct.StAsa || tiklananItem == marketitemlistStruct.PrAsa  ){
                                        let urlImage = URL(string: "https://backhub.site/wildbite/image/Items/yayArbalet/YayArbaletDiamond/\(itemler.image).png")!
                                        DispatchQueue.main.async{ [self] in  itemImageView.kf.setImage(with: urlImage)    }
                                        itemNameLabel.text = "\(itemler.name)"
                                        itemLevelLabel.text = "+\(itemler.level)"
                                        itemDressLevelLabel.text = " \(itemler.dressMinLevel)"
                                        itemPowerLabel.text = "\(itemler.power)"
                                        itemDefenseLabel.text = "\(itemler.defense)"
                                        itemSpeedLabel.text = "\(itemler.speed)"
                                        itemHealthLabel.text = "\(itemler.health)"
                                        
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
