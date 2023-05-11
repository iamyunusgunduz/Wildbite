//
//  temListAllViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 11.04.2023.
//

import UIKit
import Alamofire
import Kingfisher


struct ItemBuy: Encodable {
    let item_id: String
}
class GelenItemlerAllAyristirma {
    var itemID = 0
    var itemName = ""
    var itemLevel = ""
    var itemPrice = ""
    var itemPriceType = ""
    var itemPriceBuy = ""
    var itemPricesell = ""
    var itemDressMinLevel = ""
    var itemDefense = ""
    var itemPower = ""
    var itemHealth = ""
    var itemSpeed = ""
    var itemImage = ""
  
}
class UserItemlerAllAyristirma {
    var itemID = 0
    var itemName = ""
    var itemLevel = ""
    var itemPrice = ""
    var itemPriceType = ""
    var itemPriceBuy = ""
    var itemPricesell = ""
    var itemDressMinLevel = ""
    var itemDefense = ""
    var itemPower = ""
    var itemHealth = ""
    var itemSpeed = ""
    var itemImage = ""

  
}
class EnsonhaliKlass {
    var itemID = 0
    var itemName = ""
    var itemLevel = ""
    var itemPrice = ""
    var itemPriceType = ""
    var itemPriceBuy = ""
    var itemPricesell = ""
    var itemDressMinLevel = ""
    var itemDefense = ""
    var itemPower = ""
    var itemHealth = ""
    var itemSpeed = ""
    var itemImage = ""

  
}
 

class itemListAllViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    public  var gelenItemlerAlls = [GelenItemlerAllAyristirma]()
    public  var userItemlerAlls = [UserItemlerAllAyristirma]()
    public  var ensonhaliDizi = [EnsonhaliKlass]()
  
  
    override func viewDidAppear(_ animated: Bool) {
      
    }
    
    override func viewWillAppear(_ animated: Bool) {

           
        allItemList()

    }
    
    
 
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("asdas \(ensonhaliDizi.count)")
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print("Secilen sec \(ensonhaliDizi[indexPath.section].itemName)")
       
       
        
        
        if(ensonhaliDizi[indexPath.section].itemPriceType == "1" ){
            ensonhaliDizi[indexPath.section].itemPriceType = "GOLD"
        }
        if(ensonhaliDizi[indexPath.section].itemPriceType == "2" ){
            ensonhaliDizi[indexPath.section].itemPriceType = "DIAMOND"
        }
        let alert = UIAlertController(title: "\n\n\n\n \(ensonhaliDizi[indexPath.section].itemName)  ",
                                      message: "\nDress Level : \(ensonhaliDizi[indexPath.section].itemDressMinLevel) \n Power: \(ensonhaliDizi[indexPath.section].itemPower) \nDefanse: \(ensonhaliDizi[indexPath.section].itemDefense) \n Speed: \(ensonhaliDizi[indexPath.section].itemSpeed) \n Buy price: \(ensonhaliDizi[indexPath.section].itemPriceBuy)  \( ensonhaliDizi[indexPath.section].itemPriceType)", preferredStyle: .alert)
            
        let imageView = UIImageView(frame: CGRect(x: 90, y: 10, width: 90, height: 90))
        let url = URL(string: "\(ensonhaliDizi[indexPath.section].itemImage)")
       
        imageView.kf.setImage(with: url)

        alert.view.addSubview(imageView)
        let okButton = UIAlertAction(title: "BUY", style: .default) { [self] (action) in
                   print("ok was clicked")
            //MARK: -item buy
            
            let itembuy = ItemBuy(item_id: "\(ensonhaliDizi[indexPath.section].itemID) ")
            
            let myUserToken = UserDefaults.standard.value(forKey: "userToken")
            let myUserID = UserDefaults.standard.value(forKey: "userID")
            
            print("User Token: \(myUserToken!)")
            
                    let token = "\(myUserToken!)"
                    
                    let headers: HTTPHeaders = [
                    
                        .authorization(bearerToken: token),
                        .accept("application/json")
                        
                    ]
            
        
            AF.request("http://yunusgunduz.site/wildbite/public/api/item_buy/\(myUserID!)",
                       method: .post,
                       parameters: itembuy, encoder: JSONParameterEncoder.default, headers: headers)
  
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { [self] response in
                debugPrint(response)
                
                switch response.result {
                case .success:
                    print("Buying Successful")
                    
                    let itemBuyModel = try? JSONDecoder().decode(ItemBuyModel.self, from: response.data!)
                    
                    print("SONUC MESAJI : \(itemBuyModel!.message)")
                    
                   
                    
                    userItemlerAlls.removeAll()
                    ensonhaliDizi.removeAll()
                    gelenItemlerAlls.removeAll()
                    allItemList()
                case let .failure(error):
                    print(error.errorDescription!)
                    print("Satin Alma hatasi")
                }
            }
           
          
               }
        
     
               let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                   print("cancel was clicked")
              }
            alert.addAction(okButton)
              alert.addAction(cancelButton)
               present(alert, animated: true) {
                   print("alert is done")
               }
                  
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return  ensonhaliDizi.count
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "ItemListAllCell") as! ItemListAllTableViewCell
        
        
        cell.queryLabel.text = "\(indexPath.section+1)"
        
        let url = URL(string: "\(ensonhaliDizi[indexPath.section].itemImage)")
        let url2 = URL(string: "http://yunusgunduz.site/wildbite/image/iksir/2.png")!
        print("Image url : \(url ?? url2))")
        cell.itemImageView.kf.setImage(with: url ?? url2)
        
        cell.nameLabel.text = "\(ensonhaliDizi[indexPath.section].itemName)"
      //  cell.artiLabel.text = "+\(gelenItemlerAlls[indexPath.row].itemPrice)"
        cell.dressLabel.text = "Min dress lvl: \(ensonhaliDizi[indexPath.section].itemDressMinLevel)"
        switch ensonhaliDizi[indexPath.section].itemPriceType{
        case "1":
            ensonhaliDizi[indexPath.section].itemPriceType = "Gold"
        case "2":
            ensonhaliDizi[indexPath.section].itemPriceType = "Diamond"
        default: break
        
        }

        cell.priceSellLabel.text = "\(ensonhaliDizi[indexPath.section].itemPricesell) Selling \(ensonhaliDizi[indexPath.section].itemPriceType)  "
        cell.priceBuyLabel.text = "\(ensonhaliDizi[indexPath.section].itemPriceBuy) Selling \(ensonhaliDizi[indexPath.section].itemPriceType)  "
        
     
        cell.dressLabel.text = ensonhaliDizi[indexPath.section].itemName
        return cell
    }
    
   

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        
    }
    func userBilgileriCek(){
        
        
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
        
     
      
        AF.request("http://yunusgunduz.site/wildbite/public/api/user/\(myUserID!))" , headers: headers )
     //   AF.request("http://yunusgunduz.site/wildbite/public/api/item-shop-filter?shop=1" , headers: headers )
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData { [self]  response in

                switch response.result {
                case .success:
                    print("Validation Successful")
           
                    
                    let profileModelresponse = try? JSONDecoder().decode(ProfileModel.self, from: response.data!)
                   debugPrint(profileModelresponse!)
                    print(profileModelresponse!.user.name)
                    profileModelresponse!.item.forEach { Item in
                        print("User Envanterdeki itemler id \(Item.id)  name \(Item.name)")
                        
                        
                        let itemler = UserItemlerAllAyristirma()
                        
                  
                        
                        itemler.itemID = Item.id
                        itemler.itemName = Item.name
                        itemler.itemLevel = Item.level
                        itemler.itemPrice = Item.price
                        itemler.itemPriceType = Item.priceType
                        itemler.itemPriceBuy = Item.priceBuy
                        itemler.itemPricesell = Item.priceSell
                        itemler.itemDressMinLevel = Item.dressMinLevel
                        itemler.itemDefense = Item.defense
                        itemler.itemPower = Item.power
                        itemler.itemHealth = Item.health
                        itemler.itemSpeed = Item.speed
                        itemler.itemImage = Item.image
                      
        
                        userItemlerAlls.append(itemler)
                        
                        
                    }
                  
                    
                 
                  
                    ensonHaliFunc()
                   
                case let .failure(error):
                    print(error.errorDescription!)
                    print("hata")
                }
            }
    }
    
    func ensonHaliFunc(){
        

       
        userItemlerAlls.forEach { UserItemlerAllAyristirma in
            print("&&&&&&&&&&&&&&& E \(UserItemlerAllAyristirma.itemName)")
      
            gelenItemlerAlls.forEach { GelenItemlerAllAyristirma in
            print("&&&&&&&&&&&&&&& S \(GelenItemlerAllAyristirma.itemName)")
           
                if(GelenItemlerAllAyristirma.itemID == UserItemlerAllAyristirma.itemID ){
                    print("&&&&&&&&&&&&&&& +SE+ \(GelenItemlerAllAyristirma.itemName)")

                    
                }else{
                  
                    let itemler = EnsonhaliKlass()
                    
                    itemler.itemID = GelenItemlerAllAyristirma.itemID
                    itemler.itemName = GelenItemlerAllAyristirma.itemName
                    itemler.itemLevel = GelenItemlerAllAyristirma.itemLevel
                    itemler.itemPrice = GelenItemlerAllAyristirma.itemPrice
                    itemler.itemPriceType = GelenItemlerAllAyristirma.itemPriceType
                    itemler.itemPriceBuy = GelenItemlerAllAyristirma.itemPriceBuy
                    itemler.itemPricesell = GelenItemlerAllAyristirma.itemPricesell
                    itemler.itemDressMinLevel = GelenItemlerAllAyristirma.itemDressMinLevel
                    itemler.itemDefense = GelenItemlerAllAyristirma.itemDefense
                    itemler.itemPower = GelenItemlerAllAyristirma.itemPower
                    itemler.itemHealth = GelenItemlerAllAyristirma.itemHealth
                    itemler.itemSpeed = GelenItemlerAllAyristirma.itemSpeed
                    itemler.itemImage = GelenItemlerAllAyristirma.itemImage
                  
                    
                  
                    ensonhaliDizi.append(itemler)
                    print("&&&&&&&&&&&&&&& -SE- \(GelenItemlerAllAyristirma.itemName)")
                }
            }
        }
        
        
       
   
       
        ensonhaliDizi.forEach { EnsonhaliKlass in
            print("Secilen = \(EnsonhaliKlass.itemName)")
        }
        
        
        myTableView.delegate = self
        myTableView.dataSource = self

        
        myTableView.reloadData()
    }
    
     func allItemList(){
        let myUserToken = UserDefaults.standard.value(forKey: "userToken")
        
        
        print("User Token: \(myUserToken!)")
        
                let token = "\(myUserToken!)"
                
                let headers: HTTPHeaders = [
                
                    .authorization(bearerToken: token),
                    .accept("application/json")
                    
                ]
        
     
      
        AF.request("http://yunusgunduz.site/wildbite/public/api/item" , headers: headers )
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { [self]  response in
                
                
                switch response.result {
                case .success:
                    print("Validation Successful")
                    
                    let itemListAllModel = try? JSONDecoder().decode(ItemListAllModel.self, from: response.data!)

                    debugPrint(itemListAllModel!)
                    
                 
                        itemListAllModel!.items.forEach { Item in
                           print("Item name: \( Item.name)")
                         
                            let itemler = GelenItemlerAllAyristirma()
                            
                            itemler.itemID = Item.id
                            itemler.itemName = Item.name
                            itemler.itemLevel = Item.level
                            itemler.itemPrice = Item.price
                            itemler.itemPriceType = Item.priceType
                            itemler.itemPriceBuy = Item.priceBuy
                            itemler.itemPricesell = Item.priceSell
                            itemler.itemDressMinLevel = Item.dressMinLevel
                            itemler.itemDefense = Item.defense
                            itemler.itemPower = Item.power
                            itemler.itemHealth = Item.health
                            itemler.itemSpeed = Item.speed
                            itemler.itemImage = Item.image
                            
                            
                            itemler.itemName = Item.name
                            
                            gelenItemlerAlls.append(itemler)
                          
                        }
                   
                       
                    gelenItemlerAlls.forEach { UserItemlerAllAyristirma in
                      debugPrint("Envanter bilgileri cek -----------------\(UserItemlerAllAyristirma.itemName)")
                    }
                   
                   userBilgileriCek()
                  
                case let .failure(error):
                    print(error.errorDescription!)
                    print("hata")
                }
            }
       
    }
  
    
    
}
