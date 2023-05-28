//
//  ShopItemsViewController.swift
//  wildbite
//
//  Created by Yunus Gündüz on 11.05.2023.
//

import UIKit
import Alamofire

class ShopItemsViewController: UIViewController {

    var itemResimleri = [String]()
    var itemAdi = [String]()
    var itemID = [Int]()
    var itemDressLevel = [String]()
    var itemLevel = [String]()
    var itemPower = [String]()
    var itemDefense = [String]()
    var itemSpeed = [String]()
    var itemHealth = [String]()
    @IBOutlet weak var kasaName: UILabel!
    @IBOutlet weak var userGoldLabel: UILabel!
   
    
    @IBOutlet weak var kasaImage: UIImageView!
    
    @IBOutlet weak var kasaAcButtonLabel: UIButton!
    @IBOutlet weak var itemGiyButtonLabel: UIButton!
    var countdownSeconds = 12
       var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
       
        
        print("Shop id: \(UserDefaults.standard.integer(forKey: "ShopMenuID"))")
        print("Shop Name: \(UserDefaults.standard.string(forKey: "ShopMenuAD")!)")
       
        print("Shop image: \(UserDefaults.standard.string(forKey: "ShopMenuImage")!)")
        loadUserProfile()
        veriCekShop()
       
    }
    fileprivate func loadUserProfile() {
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
                        
                        print("Debug: Race settings\(profileModelresponse!.race.raceName)")
                        print("Race: \(profileModelresponse!.race.raceName)")
                        var itemResimAdi = UserDefaults.standard.array(forKey: "itemCekilisiItemResimleri")
                        if(  Int((profileModelresponse!.user.gold))! >= 1000) {
                            kasaAcButtonLabel.isEnabled = true
                            userGoldLabel.text = "User Gold: \(Int((profileModelresponse!.user.gold))!)"
                            
                        }else{
                            kasaAcButtonLabel.isEnabled = false
                            userGoldLabel.text = "User Gold: \(Int((profileModelresponse!.user.gold))!)"
                        }
                        
                    case let .failure(error):
                        print(error.errorDescription!)
                        print("hata")
                }
            }
    }
    // shop id 13 kasalar
    // 1:gold 2 : diamond

  func veriCekShop() {
 
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
                        //  dump(sopMenuResponse)
                        sopMenuResponse?.item.forEach({ item in
                            print(item.name)
                            print(item.image)
                            
                            itemResimleri.append(item.image)
                            itemAdi.append(item.name)
                            itemDressLevel.append(item.dressMinLevel)
                            itemLevel.append(item.level)
                            itemPower.append(item.power)
                            itemSpeed.append(item.speed)
                            itemDefense.append(item.defense)
                            itemHealth.append(item.health)
                            itemID.append(item.id)
                            
                        })
                        
                        UserDefaults.standard.set(itemResimleri, forKey: "itemCekilisiItemResimleri")
                        UserDefaults.standard.set(itemAdi, forKey: "itemCekilisiItemAdi")
                        UserDefaults.standard.set(itemDressLevel, forKey: "itemCekilisiItemDressLevel")
                        UserDefaults.standard.set(itemLevel, forKey: "itemCekilisiItemLevel")
                        UserDefaults.standard.set(itemPower, forKey: "itemCekilisiItemPower")
                        UserDefaults.standard.set(itemDefense, forKey: "itemCekilisiItemDefense")
                        UserDefaults.standard.set(itemSpeed, forKey: "itemCekilisiItemSpeed")
                        UserDefaults.standard.set(itemHealth, forKey: "itemCekilisiItemHealth")
                        UserDefaults.standard.set(itemID, forKey: "itemCekilisiItemID")
                        
                    
                       
                        print("apiden item adedi \(itemResimleri.count)")
                        var itemResimAdi = UserDefaults.standard.array(forKey: "itemCekilisiItemResimleri")
                        
                      
                    case let .failure(error):
                        print(error.errorDescription!)
                        print("hata")
                    }
                    
                    
                }
            }
    
   
    func startCountdown() {
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
  

   
  
    @objc func updateCountdown() {
         itemGiyButtonLabel.isEnabled = false
        kasaAcButtonLabel.isEnabled = false
        let itemResimAdiUD = UserDefaults.standard.array(forKey: "itemCekilisiItemResimleri")
        let itemItemAdiUD = UserDefaults.standard.array(forKey: "itemCekilisiItemAdi")
        
   
        
        let itemItemDressLevelUD = UserDefaults.standard.array(forKey: "itemCekilisiItemDressLevel")
        let itemItemLevelUD = UserDefaults.standard.array(forKey: "itemCekilisiItemLevel")
        let itemItemPowerUD = UserDefaults.standard.array(forKey: "itemCekilisiItemPower")
        let itemItemDefenseUD = UserDefaults.standard.array(forKey: "itemCekilisiItemDefense")
        let itemItemSpeedUD = UserDefaults.standard.array(forKey: "itemCekilisiItemSpeed")
        let itemItemHealthUD = UserDefaults.standard.array(forKey: "itemCekilisiItemHealth")
        let itemItemRandomNumberUD = UserDefaults.standard.array(forKey: "itemCekilisiRandomNumber")
        
        
        dump(itemResimAdiUD)
        if countdownSeconds > 0 {
            countdownSeconds -= 1
           
            if(itemResimleri.count != 0){
                let randomNumber = Int.random(in: 0 ... itemResimAdiUD!.count-1)
                print("random Number : \(randomNumber)")
                let urlImage = URL(string: "\(itemResimAdiUD![randomNumber])")
                DispatchQueue.main.async{ [self] in
                    
                      self.kasaImage.kf.setImage(with: urlImage)
                   
                      
                  }
                kasaName.text = "\(itemItemAdiUD![randomNumber])"
            }
           
            
        dump("\(countdownSeconds)")
        } else { //MARK: cikan item
            timer?.invalidate()
            if(itemResimAdiUD!.count != 0){
                let randomNumber = Int.random(in: 0 ... itemResimAdiUD!.count-1)
                UserDefaults.standard.set(randomNumber, forKey: "itemCekilisiRandomNumber")
                print("random Number : \(randomNumber)")
                let urlImage = URL(string: "\(itemResimAdiUD![randomNumber])")
                DispatchQueue.main.async{ [self] in
                    
                      self.kasaImage.kf.setImage(with: urlImage)
                    kasaName.text = "\(itemItemAdiUD![randomNumber])"
                      
                  }
               
            }
             itemGiyButtonLabel.isEnabled = true
            kasaAcButtonLabel.isEnabled = false
            kasaAcButtonLabel.setTitle("yeniden aç", for: .normal)
            countdownSeconds = 12
            loadUserProfile()
        }
    }
    @IBAction func kasaAc(_ sender: Any) {
 
        startCountdown()
        userStateArttir(pow: 0, def: 0, spd: 0, totlDamge: 0, gld: -1000)
    }
    
    func userStateArttir(pow:Int, def:Int, spd:Int, totlDamge:Int, gld:Int){
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
        let userStateParameters = UserStateUpdate(power: pow, defense: def, speed: spd, total_damage: totlDamge, gold: gld)
        
      AF.request("http://yunusgunduz.site/wildbite/public/api/user-statu/\(myUserID!)",
                 method: .put,
                 parameters: userStateParameters,
                 headers: headers)
      .validate(statusCode: 200..<500)
      .validate(contentType: ["application/json"])
      .responseData { [self]  response in
          debugPrint(response)
          switch response.result {
          case .success:
                  let userStateUpdateResponse = try? JSONDecoder().decode(UserStateModel.self,  from: response.data!)
                  debugPrint(userStateUpdateResponse ?? "userStateUpdateResponse ariza")
                  dump("User state message: \(userStateUpdateResponse!.the1)")
                  dump("User state power: \(userStateUpdateResponse!.user.power)")
                  dump("User state def: \(userStateUpdateResponse!.user.defense)")
                  dump("User state speed: \(userStateUpdateResponse!.user.speed)")
                  dump("User state total damage: \(userStateUpdateResponse!.user.totalDamage)")
                  dump("User state gold: \(userStateUpdateResponse!.user.gold)")
                
                  viewWillAppear(true)
          case let .failure(error):
              print(error.errorDescription!)
              print("hata")
          }
      }

    }
}
