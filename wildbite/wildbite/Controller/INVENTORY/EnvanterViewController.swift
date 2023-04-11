//
//  CityViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 6.04.2023.
//

import UIKit
import Alamofire
import Kingfisher


class ItemFetchCity {
    var itemimage = ""
    var itemname = ""
    var itemprice = ""
    var itemlevel = ""

}

class EnvanterViewController: UIViewController {
    var itemListesi = [ItemFetchCity]()

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var myCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
            
         
           
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
                        print("Item Name: \(Item.name) Level")
                        print(Item.name)
                      
                        let itemler = ItemFetchCity()
                        
                        itemler.itemname = Item.name
                        itemler.itemimage = Item.image
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
        
        
        let alert = UIAlertController(title: "\n\n\n\n\n \(itemListesi[indexPath.row].itemname)  ", message: "\nLevel : \(itemListesi[indexPath.row].itemlevel)\nPrice: \(itemListesi[indexPath.row].itemprice) Gold \n", preferredStyle: .alert)
               let okButton = UIAlertAction(title: "Ok", style: .default) { (action) in
                   print("ok was clicked")
               }
        
        let imageView = UIImageView(frame: CGRect(x: 90, y: 10, width: 90, height: 90))
        let url = URL(string: "\(itemListesi[indexPath.row].itemimage)")
       
        imageView.kf.setImage(with: url)
       // imageView.image = yourImage

        alert.view.addSubview(imageView)
             //  let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
             //      print("cancel was clicked")
             //  }
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
