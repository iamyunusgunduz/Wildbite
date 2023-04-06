//
//  CityViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 6.04.2023.
//

import UIKit
import Alamofire



class ItemFetchCity {
    var itemimage = ""
    var itemname = ""
    var itemprice = ""
    var itemlevel = ""

}

class CityViewController: UIViewController {
    var itemListesi = [ItemFetchCity]()

    @IBOutlet weak var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
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
            .responseData { [self] response in
                
                
                switch response.result {
                case .success:
                    print("Validation Successful")
                    
                    let profileModelresponse = try? JSONDecoder().decode(ProfileModel.self, from: response.data!)
                    debugPrint(profileModelresponse!)
                    
                    print(profileModelresponse!.user.name)
                    print("Race: \(profileModelresponse!.race.raceName)")
                
                    
                    
                    profileModelresponse!.item.forEach { Item in
                        print("Item Name: \(Item.itemName) Level")
                        print(Item.itemName)
                      
                        let itemler = ItemFetchCity()
                        
                        itemler.itemname = Item.itemName
                        itemler.itemimage = Item.itemImage
                        itemler.itemlevel = Item.level
                        itemler.itemprice = Item.price
                        
                        
                        itemListesi.append(itemler)
                      
                        
                       
                        
                        
                    }
                    myCollectionView.delegate = self
                    myCollectionView.dataSource = self
                    
                case let .failure(error):
                    print(error.errorDescription!)
                    print("hata")
                }
            }
    }

   

}

extension CityViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print( "Debug : Return: \(itemListesi.count)")
        return itemListesi.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = itemListesi[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityEnvanterCell", for: indexPath) as! CityCollectionViewCell
      
        cell.itemNameLabel.text = " \(item.itemname)"
        cell.itemLevel.text = "Level: \(item.itemlevel)"
        cell.itemPrice.text = "Price: \(item.itemprice)"
      
        print( "Debug : Item: \(item.itemname)")
        
        return cell
    }
    
}

