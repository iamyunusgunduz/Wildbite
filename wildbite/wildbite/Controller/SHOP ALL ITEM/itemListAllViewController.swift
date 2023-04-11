//
//  temListAllViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 11.04.2023.
//

import UIKit
import Alamofire
import Kingfisher

 

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

class itemListAllViewController: UIViewController,UITableViewDelegate,UITableViewDataSource  {
    
    public  var gelenItemlerAlls = [GelenItemlerAllAyristirma]()

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("asdas \(gelenItemlerAlls.count)")
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "\n\n\n\n \(gelenItemlerAlls[indexPath.section].itemName)  ",
                                      message: "\nDress Level : \(gelenItemlerAlls[indexPath.section].itemDressMinLevel) \n Power: \(gelenItemlerAlls[indexPath.section].itemPower) \nDefanse: \(gelenItemlerAlls[indexPath.section].itemDefense) \n Speed: \(gelenItemlerAlls[indexPath.section].itemSpeed) \n Buy price: \(gelenItemlerAlls[indexPath.section].itemPriceBuy)", preferredStyle: .alert)
            
        let imageView = UIImageView(frame: CGRect(x: 90, y: 10, width: 90, height: 90))
        let url = URL(string: "\(gelenItemlerAlls[indexPath.section].itemImage)")
       
        imageView.kf.setImage(with: url)

        alert.view.addSubview(imageView)
    let okButton = UIAlertAction(title: "Ok", style: .default) { (action) in
                   print("ok was clicked")
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
        cell.priceSellLabel.text = "\(gelenItemlerAlls[indexPath.section].itemPricesell) Selling \(gelenItemlerAlls[indexPath.section].itemPriceType)  "
        
        return cell
    }
    
   

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
       
      
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
