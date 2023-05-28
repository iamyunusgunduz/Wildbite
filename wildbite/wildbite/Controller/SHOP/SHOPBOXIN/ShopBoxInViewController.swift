//
//  ShopBoxInViewController.swift
//  wildbite
//
//  Created by Yunus Gündüz on 28.05.2023.
//

import UIKit
import Alamofire

class ShopBoxInViewController: UIViewController,UITabBarDelegate,UITableViewDataSource, UITableViewDelegate {
    
    var gelenItemler = [itemFetchForBox]()
    @IBOutlet weak var myTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell") as! ShopBoxInTableViewCell
      
        let itemData =  gelenItemler[indexPath.section]
        let itemSans = (100 - Int(itemData.itemDressLevel)!)/10
        cell.itemNameLabel.text = "[\(itemData.itemDressLevel) Level]  \(itemData.itemName)  (+\(itemData.itemLevel))  {\(itemSans)%}"
      
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
      return  gelenItemler.count
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
 
        let shopID = UserDefaults.standard.integer(forKey: "ShopMenuID")
        let shopAD = UserDefaults.standard.string(forKey: "ShopMenuAD")!
        let shopImage = UserDefaults.standard.string(forKey: "ShopMenuImage")!
        print("Shop id: \(UserDefaults.standard.integer(forKey: "ShopMenuID"))")
        print("Shop Name: \(UserDefaults.standard.string(forKey: "ShopMenuAD")!)")
        print("Shop image: \(UserDefaults.standard.string(forKey: "ShopMenuImage")!)")
        
        let myUserToken = UserDefaults.standard.value(forKey: "userToken")
        
        print("User Token: \(myUserToken!)")
        
        let token = "\(myUserToken!)"
        
        let headers: HTTPHeaders = [
            
            .authorization(bearerToken: token),
            .accept("application/json")
            
        ]
        AF.request("http://yunusgunduz.site/wildbite/public/api/item-shop-filter?shop=\(shopID)" , headers: headers )
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData { [self] response in
                
                switch response.result {
                case .success:

                    let sopMenuResponse = try? JSONDecoder().decode(ItemShopFilter.self, from: response.data!)
                        dump(sopMenuResponse)
                        sopMenuResponse?.item.forEach({ item in
                            print(item.name)
                            var itemler = itemFetchForBox()
                           
                            itemler.itemName =  item.name
                            itemler.itemDressLevel =  item.dressMinLevel
                            itemler.itemLevel =  item.level
                            gelenItemler.append(itemler)
                            
                        })
                     
                        myTableView.reloadData()
                            myTableView.delegate = self
                            myTableView.dataSource = self
                    case let .failure(error):
                        print(error.errorDescription!)
                        print("hata")
                    }
                    
                    
                }
            }

}
