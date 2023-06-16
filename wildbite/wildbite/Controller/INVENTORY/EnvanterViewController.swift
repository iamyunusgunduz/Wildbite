//
//  CityViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 6.04.2023.
//

import UIKit
import Alamofire
import Kingfisher


struct ItemSell: Encodable {
    let item_id: String
}

class ItemFetchInvantory {
    var itemID = ""
    var itemimage = ""
    var itemname = ""
    var itemprice = ""
    var price_buy = ""
    var price_sell = ""
    var price_type = ""
    var itemlevel = ""

}

class EnvanterViewController: UIViewController {
    var itemListesi = [ItemFetchInvantory]()

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
            
         
           
    }
    fileprivate func connectToTheApi() {
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
        
        
        
        AF.request("http://backhub.site/wildbite/public/api/user/\(myUserID!))" , headers: headers )
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { [self] response in
                
                
                switch response.result {
                case .success:
                    print("Validation Successful")
                    
                    let profileModelresponse = try? JSONDecoder().decode(ProfileModel.self, from: response.data!)
                    debugPrint(profileModelresponse!)
                    
                    print(profileModelresponse!.user.name)
                    print("Race: \(profileModelresponse!.race.raceName)")
                    
                    itemListesi.removeAll()
                    
                    profileModelresponse!.item.forEach { Item in
                        print("Item Name: \(Item.name) Level")
                        print(Item.name)
                        
                        let itemler = ItemFetchInvantory()
                        
                        itemler.itemname = Item.name
                        itemler.itemimage = Item.image
                        itemler.itemlevel = Item.level
                        itemler.itemprice = Item.price
                        itemler.price_buy = Item.priceBuy
                        itemler.price_sell = Item.priceSell
                        itemler.price_type = Item.priceType
                        itemler.itemID = "\(Item.id)"
                        itemListesi.append(itemler)
                        
                        
                        
                        
                        
                    }
                    myCollectionView.delegate = self
                    myCollectionView.dataSource = self
                    myCollectionView.reloadData()
                case let .failure(error):
                    print(error.errorDescription!)
                    print("hata")
                }
            }
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
      
        connectToTheApi()
    }

   

}

extension EnvanterViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print( "Debug : Return: \(itemListesi.count)")
        return itemListesi.count
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("\(itemListesi[indexPath.row].itemname)  ")
        
        if(itemListesi[indexPath.row].price_type == "1" ){
            itemListesi[indexPath.row].price_type = "GOLD"
        }
        if(itemListesi[indexPath.row].price_type == "2" ){
            itemListesi[indexPath.row].price_type = "DIAMOND"
        }
        let alert = UIAlertController(title: "\n\n\n\n\n \(itemListesi[indexPath.row].itemname)  ", message: "\nLevel : \(itemListesi[indexPath.row].itemlevel)\nSell Price: \(itemListesi[indexPath.row].price_sell) \(itemListesi[indexPath.row].price_type) \n", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "SELL", style: .destructive) { [self] (action) in
                   print("SELL was clicked")
           
            //MARK: - ITEM SELL
            
            let itemSell = ItemSell(item_id: "\(itemListesi[indexPath.row].itemID) ")
            
            let myUserToken = UserDefaults.standard.value(forKey: "userToken")
            let myUserID = UserDefaults.standard.value(forKey: "userID")
            
            print("User Token: \(myUserToken!)")
            
                    let token = "\(myUserToken!)"
                    
                    let headers: HTTPHeaders = [
                    
                        .authorization(bearerToken: token),
                        .accept("application/json")
                        
                    ]
            
        
            AF.request("http://backhub.site/wildbite/public/api/item_sell/\(myUserID!)",
                       method: .post,
                       parameters: itemSell, encoder: JSONParameterEncoder.default, headers: headers)
  
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { [self] response in
                debugPrint(response)
                
                switch response.result {
                case .success:
                    print("Selling Successful")
                    
                    let itemSellModel = try? JSONDecoder().decode(ItemSellModel.self, from: response.data!)
                    
                    print("SONUC MESAJI : \(itemSellModel!.message)")
                    itemListesi.removeAll()
                    connectToTheApi()
                 
                    
                    
                case let .failure(error):
                    print(error.errorDescription!)
                    print("Satma hatasi")
                }
            }
            
            
            
            
               }
        
        let imageView = UIImageView(frame: CGRect(x: 90, y: 10, width: 90, height: 90))
        let url = URL(string: "\(itemListesi[indexPath.row].itemimage)")
       
        imageView.kf.setImage(with: url)
       // imageView.image = yourImage

        alert.view.addSubview(imageView)
             //  let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
             //      print("cancel was clicked")
             //  }
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("cancel was clicked")
            //MARK: - ALERT CANCEL
            
       }
 
        let dressButton = UIAlertAction(title: "Dress", style: .default) { (action) in
            print("DRESS was clicked")
            //MARK: - ITEM DRESS
            
       }
 
        
        alert.addAction(cancelButton)
        
       alert.addAction(dressButton)
        
     
               alert.addAction(okButton)
              // alert.addAction(cancelButton)
               present(alert, animated: true) {
                   print("alert is done")
               }
                  
              
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = itemListesi[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EnvanterCell", for: indexPath) as! InventoryCollectionViewCell
        
        cell.itemNameLabel.text = " \(item.itemname)"
        cell.itemLevel.text = "Level: \(item.itemlevel)"
        cell.itemPrice.text = "Price: \(item.itemprice)"
        let url = URL(string: "\(item.itemimage)")
       
        cell.itemImage.kf.setImage(with: url)
        print( "Debug : Item: \(item.itemname)")
        
        return cell
    }
    
    
    override func viewDidLayoutSubviews() {
            flowLayout.scrollDirection = .vertical
                    flowLayout.minimumLineSpacing = 10
                    flowLayout.minimumInteritemSpacing = 1
            flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 1, bottom: 1, right: 1)
        }
    
}
