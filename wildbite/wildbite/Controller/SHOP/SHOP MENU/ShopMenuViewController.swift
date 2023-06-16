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
    @IBOutlet weak var KasalarSegmentedControl: UISegmentedControl!
    var gelenMenuler = [menuFetch]()
    var gelenMenulerStandart = [menuFetch]()
    var gelenMenulerPremium = [menuFetch]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch KasalarSegmentedControl.selectedSegmentIndex{
            case 0:
                print("\(gelenMenulerStandart[indexPath.section].menuName)")
                print("\(gelenMenulerStandart[indexPath.section].menuId)")
                  
                  
                          performSegue(withIdentifier: "shopMenuToShopItems", sender: nil)
                          UserDefaults.standard.set("\(gelenMenulerStandart[indexPath.section].menuId)", forKey: "ShopMenuID")
                          UserDefaults.standard.set("\(gelenMenulerStandart[indexPath.section].menuName)", forKey: "ShopMenuAD")
                          UserDefaults.standard.set("\(gelenMenulerStandart[indexPath.section].menuImage)", forKey: "ShopMenuImage")
            case 1:
                print("\(gelenMenulerPremium[indexPath.section].menuName)")
                print("\(gelenMenulerPremium[indexPath.section].menuId)")
                  
                  
                          performSegue(withIdentifier: "shopMenuToShopItems", sender: nil)
                          UserDefaults.standard.set("\(gelenMenulerPremium[indexPath.section].menuId)", forKey: "ShopMenuID")
                          UserDefaults.standard.set("\(gelenMenulerPremium[indexPath.section].menuName)", forKey: "ShopMenuAD")
                          UserDefaults.standard.set("\(gelenMenulerPremium[indexPath.section].menuImage)", forKey: "ShopMenuImage")
           default:
                print("\(gelenMenuler[indexPath.section].menuName)")
                print("\(gelenMenuler[indexPath.section].menuId)")
                  
                  
                          performSegue(withIdentifier: "shopMenuToShopItems", sender: nil)
                          UserDefaults.standard.set("\(gelenMenuler[indexPath.section].menuId)", forKey: "ShopMenuID")
                          UserDefaults.standard.set("\(gelenMenuler[indexPath.section].menuName)", forKey: "ShopMenuAD")
                          UserDefaults.standard.set("\(gelenMenuler[indexPath.section].menuImage)", forKey: "ShopMenuImage")
        }
      
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        switch KasalarSegmentedControl.selectedSegmentIndex{
            case 0:
                return gelenMenulerStandart.count
            case 1:
                return gelenMenulerPremium.count
           default:
                return gelenMenuler.count
        }
      
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "ShopMenuCell") as! ShopMenuTableViewCell
        switch KasalarSegmentedControl.selectedSegmentIndex{
            case 0:
                cell.menuAdiLabel.text = gelenMenulerStandart[indexPath.section].menuName
                let url = URL(string: "https://backhub.site/wildbite/image/kasa/\(gelenMenulerStandart[indexPath.section].menuImage).png")
                cell.shopImageView.kf.setImage(with: url )
            case 1:
                cell.menuAdiLabel.text = gelenMenulerPremium[indexPath.section].menuName
                let url = URL(string: "https://backhub.site/wildbite/image/kasa/\(gelenMenulerPremium[indexPath.section].menuImage).png")
                cell.shopImageView.kf.setImage(with: url )
           default:
                cell.menuAdiLabel.text = gelenMenuler[indexPath.section].menuName
                let url = URL(string: "https://backhub.site/wildbite/image/kasa/\(gelenMenuler[indexPath.section].menuImage).png")
                cell.shopImageView.kf.setImage(with: url )
        }
       
        return cell
    }
    
    
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background.png")!)
        
    }
    
    @IBAction func KasalarSegmentedControl(_ sender: Any) {
        
        switch KasalarSegmentedControl.selectedSegmentIndex{
            case 0:
                myTableView.reloadData()
            case 1:
                myTableView.reloadData()
           default:
                myTableView.reloadData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        
        let myUserToken = UserDefaults.standard.value(forKey: "userToken")
        
        print("User Token: \(myUserToken!)")
        
        let token = "\(myUserToken!)"
        
        let headers: HTTPHeaders = [
            
            .authorization(bearerToken: token),
            .accept("application/json")
            
        ]
        AF.request("http://backhub.site/wildbite/public/api/shop" , headers: headers )
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData { [self] response in
                
                switch response.result {
                case .success:
                    
                    print("Validation Successful")
                    
                    let sopMenuResponse = try? JSONDecoder().decode(ShopMenuModel.self, from: response.data!)
                    
                    //dump(sopMenuResponse!)

                    
                    sopMenuResponse!.shop.forEach { Shop in
                        print("Shop Name: \(Shop.name)")
                        print("Shop ID: \(Shop.id)")
                        print("Shop IMAGE: \(Shop.image)")
                        
                        if(Shop.name.contains("STANDART")){
                            let menuler = menuFetch()
                            menuler.menuName = Shop.name
                            menuler.menuId = Shop.id
                            menuler.menuImage = Shop.image
                          
                            gelenMenulerStandart.append(menuler)
                        }
                        if(Shop.name.contains("PREMIUM")){
                            let menuler = menuFetch()
                            menuler.menuName = Shop.name
                            menuler.menuId = Shop.id
                            menuler.menuImage = Shop.image
                          
                            gelenMenulerPremium.append(menuler)
                        }
                        
                         
                        
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
    

