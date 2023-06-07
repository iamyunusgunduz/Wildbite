//
//  ShopMenuViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 11.04.2023.
//

import UIKit
import Alamofire
import Kingfisher

class menuFetch {
    var menuId = 0
    var menuName = ""
    var menuImage = ""
}
class ShopMenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var gelenMenuler = [menuFetch]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      print("\(gelenMenuler[indexPath.section].menuName)")
      print("\(gelenMenuler[indexPath.section].menuId)")
        
        
                performSegue(withIdentifier: "shopMenuToShopItems", sender: nil)
                UserDefaults.standard.set("\(gelenMenuler[indexPath.section].menuId)", forKey: "ShopMenuID")
                UserDefaults.standard.set("\(gelenMenuler[indexPath.section].menuName)", forKey: "ShopMenuAD")
                UserDefaults.standard.set("\(gelenMenuler[indexPath.section].menuImage)", forKey: "ShopMenuImage")
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return gelenMenuler.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "ShopMenuCell") as! ShopMenuTableViewCell
        cell.menuAdiLabel.text = gelenMenuler[indexPath.section].menuName
        let url = URL(string: "https://yunusgunduz.site/wildbite/image/kasa/\(gelenMenuler[indexPath.section].menuImage).png")
        cell.shopImageView.kf.setImage(with: url )
        return cell
    }
    
    
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background.png")!)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let myUserToken = UserDefaults.standard.value(forKey: "userToken")
        
        print("User Token: \(myUserToken!)")
        
        let token = "\(myUserToken!)"
        
        let headers: HTTPHeaders = [
            
            .authorization(bearerToken: token),
            .accept("application/json")
            
        ]
        AF.request("http://yunusgunduz.site/wildbite/public/api/shop" , headers: headers )
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData { [self] response in
                
                switch response.result {
                case .success:
                    
                    print("Validation Successful")
                    
                    let sopMenuResponse = try? JSONDecoder().decode(ShopMenuModel.self, from: response.data!)
                    
                    dump(sopMenuResponse!)

                    
                    sopMenuResponse!.shop.forEach { Shop in
                        print("Shop Name: \(Shop.name)")
                        print("Shop ID: \(Shop.id)")
                        
                        
                        let menuler = menuFetch()
                        menuler.menuName = Shop.name
                        menuler.menuId = Shop.id
                        menuler.menuImage = Shop.image
                        gelenMenuler.append(menuler)
                         
                        
                    }
                        UserDefaults.standard.removeObject(forKey: "itemCekilisiItemResimleri")
                        UserDefaults.standard.removeObject(forKey: "itemCekilisiItemAdi")
                        UserDefaults.standard.removeObject(forKey: "itemCekilisiItemAdedi")
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
    

