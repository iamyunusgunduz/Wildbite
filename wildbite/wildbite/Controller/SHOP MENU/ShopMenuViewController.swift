//
//  ShopMenuViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 11.04.2023.
//

import UIKit
import Alamofire

class menuFetch {
    var menuId = 0
    var menuName = ""
}
class ShopMenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var gelenMenuler = [menuFetch]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      print("\(gelenMenuler[indexPath.section].menuName)")
      print("\(gelenMenuler[indexPath.section].menuId)")
        
       
        switch gelenMenuler[indexPath.section].menuId{
        case 1:
            print("MENU1")
        case 2:
            print("MENU2")
        case 3:
            print("MENU3")
        case 4:
            print("MENU4")
        case 5:
            print("MENU5")
        case 6:
            print("MENU6")
        case 7:
            print("MENU7")
        case 8:
            print("MENU8")
        case 12:
            print("MENU12")
            performSegue(withIdentifier: "shopMenuToMENU12", sender: nil)
        default:
           break
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return gelenMenuler.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "ShopMenuCell") as! ShopMenuTableViewCell
        cell.menuAdiLabel.text = gelenMenuler[indexPath.section].menuName
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
        AF.request("http://yunusgunduz.site/wildbite/public/api/shop" , headers: headers )
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { [self] response in
                
                switch response.result {
                case .success:
                    
                    print("Validation Successful")
                    
                    let sopMenuResponse = try? JSONDecoder().decode(ShopMenuModel.self, from: response.data!)
                    
                    debugPrint(sopMenuResponse!)

                    
                    sopMenuResponse!.shop.forEach { Shop in
                        print("Shop Name: \(Shop.name)")
                        
                        
                         let menuler = menuFetch()
                        menuler.menuName = Shop.name
                        menuler.menuId = Shop.id
                        gelenMenuler.append(menuler)
                         
                        
                    }
                        
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
    

