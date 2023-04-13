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

  
}

class itemListAllViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    public  var gelenItemlerAlls = [GelenItemlerAllAyristirma]()
    public  var userItemlerAlls = [UserItemlerAllAyristirma]()
    override func viewWillAppear(_ animated: Bool) {
         
        allItemList()
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("asdas \(gelenItemlerAlls.count)")
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(gelenItemlerAlls[indexPath.section].itemPriceType == "1" ){
            gelenItemlerAlls[indexPath.section].itemPriceType = "GOLD"
        }
        if(gelenItemlerAlls[indexPath.section].itemPriceType == "2" ){
            gelenItemlerAlls[indexPath.section].itemPriceType = "DIAMOND"
        }
        let alert = UIAlertController(title: "\n\n\n\n \(gelenItemlerAlls[indexPath.section].itemName)  ",
                                      message: "\nDress Level : \(gelenItemlerAlls[indexPath.section].itemDressMinLevel) \n Power: \(gelenItemlerAlls[indexPath.section].itemPower) \nDefanse: \(gelenItemlerAlls[indexPath.section].itemDefense) \n Speed: \(gelenItemlerAlls[indexPath.section].itemSpeed) \n Buy price: \(gelenItemlerAlls[indexPath.section].itemPriceBuy)  \( gelenItemlerAlls[indexPath.section].itemPriceType)", preferredStyle: .alert)
            
        let imageView = UIImageView(frame: CGRect(x: 90, y: 10, width: 90, height: 90))
        let url = URL(string: "\(gelenItemlerAlls[indexPath.section].itemImage)")
       
        imageView.kf.setImage(with: url)

        alert.view.addSubview(imageView)
        let okButton = UIAlertAction(title: "BUY", style: .default) { [self] (action) in
                   print("ok was clicked")
//MARK: -item buy
            
            let itembuy = ItemBuy(item_id: "\(gelenItemlerAlls[indexPath.section].itemID) ")
            
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
            .responseData { response in
                debugPrint(response)
                
                switch response.result {
                case .success:
                    print("Buying Successful")
                    
                    let itemBuyModel = try? JSONDecoder().decode(ItemBuyModel.self, from: response.data!)
                    
                    print("SONUC MESAJI : \(itemBuyModel!.message)")
                    
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
        return  gelenItemlerAlls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "ItemListAllCell") as! ItemListAllTableViewCell
        
        
        cell.queryLabel.text = "\(indexPath.section+1)"
        
        let url = URL(string: "\(gelenItemlerAlls[indexPath.section].itemImage)")
        let url2 = URL(string: "http://yunusgunduz.site/wildbite/image/iksir/2.png")!
        print("Image url : \(url ?? url2))")
        cell.itemImageView.kf.setImage(with: url ?? url2)
        
        cell.nameLabel.text = "\(gelenItemlerAlls[indexPath.section].itemName)"
      //  cell.artiLabel.text = "+\(gelenItemlerAlls[indexPath.row].itemPrice)"
        cell.dressLabel.text = "Min dress lvl: \(gelenItemlerAlls[indexPath.section].itemDressMinLevel)"
        switch gelenItemlerAlls[indexPath.section].itemPriceType{
        case "1":
            gelenItemlerAlls[indexPath.section].itemPriceType = "Gold"
        case "2":
            gelenItemlerAlls[indexPath.section].itemPriceType = "Diamond"
        default: break
        
        }
       
            cell.priceBuyLabel.text = "\(gelenItemlerAlls[indexPath.section].itemPriceBuy) Buying \(gelenItemlerAlls[indexPath.section].itemPriceType)"
         //   cell.backgroundColor = .cyan
        
        cell.priceSellLabel.text = "\(gelenItemlerAlls[indexPath.section].itemPricesell) Selling \(gelenItemlerAlls[indexPath.section].itemPriceType)  "
        
        gelenItemlerAlls.forEach { GelenItemlerAllAyristirma in
            userItemlerAlls.forEach { UserItemlerAllAyristirma in
               
                print("Debug: Gelen \(GelenItemlerAllAyristirma.itemName)  Var \(UserItemlerAllAyristirma.itemName) ")
              
                if (GelenItemlerAllAyristirma.itemName ==  UserItemlerAllAyristirma.itemName ){
                //    print("!=")
                    
                    print("Debug: -- \(GelenItemlerAllAyristirma.itemName)  Var \(UserItemlerAllAyristirma.itemName) ")
                    
                  
                }
              
            }
            }
    
        
       
           
        
        
        
        return cell
    }
    
   

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        userBilgileriCek()
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
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { [self]  response in

                switch response.result {
                case .success:
                    print("Validation Successful")
                    
                    let profileModelresponse = try? JSONDecoder().decode(ProfileModel.self, from: response.data!)
                    debugPrint(profileModelresponse!)
                    print(profileModelresponse!.user.name)
                    profileModelresponse!.item.forEach { Item in
                        print("User Envanterdeki itemler \(Item.id)  \(Item.name)")
                        
                        
                        let itemler = UserItemlerAllAyristirma()
                        
                        itemler.itemID = Item.id
                        itemler.itemName = Item.name
                       
                       
                        
                        userItemlerAlls.append(itemler)
                        
                        
                    }
                    
                
                    
                 
                    
                 
                    
                case let .failure(error):
                    print(error.errorDescription!)
                    print("hata")
                }
            }
    }
    
    fileprivate func allItemList(){
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
                        
                        myTableView.delegate = self
                        myTableView.dataSource = self
                        
                        myTableView.reloadData()
                    
                   
                   
                    
                case let .failure(error):
                    print(error.errorDescription!)
                    print("hata")
                }
            }
       
    }
  
    
    
}
