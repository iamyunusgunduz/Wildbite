//
//  UserProfileViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 29.03.2023.
//

import UIKit
import Alamofire
import Kingfisher


class ItemFetch {
    var itemimage = ""
    var itemname = ""
    var itemprice = ""
    var itemlevel = ""

}


class UserProfileViewController: UIViewController {
  
    @IBOutlet weak var userProfileImageView: UIImageView!
    

    @IBOutlet weak var kaskImage: UIImageView!
    @IBOutlet weak var zirhImage: UIImageView!
    @IBOutlet weak var silahImage: UIImageView!
    @IBOutlet weak var kalkanImage: UIImageView!
    @IBOutlet weak var kolyeImage: UIImageView!
    @IBOutlet weak var eldivenImage: UIImageView!
    @IBOutlet weak var ayakkabiImage: UIImageView!
    
    
    
    
    
    
    
    
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    @IBOutlet weak var userlevelLabel: UILabel!
    
    @IBOutlet weak var usertecrubeLabel: UILabel!
    
    @IBOutlet weak var userEnerjiLabel: UILabel!
    
    @IBOutlet weak var userCanLabel: UILabel!
    
    @IBOutlet weak var userGoldLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       

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
                        usernameLabel.text = "Name: \(profileModelresponse?.user.name ?? "none")"
                        userlevelLabel.text = "Level: \(profileModelresponse?.user.level ?? "none")"
                        usertecrubeLabel.text = "Exp: \(profileModelresponse?.user.exp  ?? "none")"
                        userEnerjiLabel.text = "Energy: \(profileModelresponse?.user.currentEnergy ?? "none")/\(profileModelresponse?.user.maximumEnergy ?? "none")"
                        userCanLabel.text = "Can: \(profileModelresponse?.user.currentHealth ?? "none")/\(profileModelresponse?.user.maximumHealth ?? "none")"
                        userGoldLabel.text = "Gold: \(profileModelresponse?.user.gold ?? "none")"
                        
                        let url = URL(string: "\(profileModelresponse!.user.image)")
                        let url2 = URL(string: "http://yunusgunduz.site/wildbite/image/iksir/2.png")!
                        
                        print("Image url : \(url ?? url2)")
                        userProfileImageView.kf.setImage(with: url ?? url2)
                        
                        profileModelresponse!.item.forEach { Item in
                            print("Item Name: \(Item.name) Level")
                            print(Item.name)
                            
                        }
                        
                    case let .failure(error):
                        print(error.errorDescription!)
                        print("hata")
                }
            }
    }
    fileprivate func loadUserDressedItems() {
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

        AF.request("http://yunusgunduz.site/wildbite/public/api/dressed-enemy/\(myUserID!))" , headers: headers )
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData { [self] response in
                
                
                switch response.result {
                    case .success:
                        print("dress list Successful")
                        
                        let dressResponse = try? JSONDecoder().decode(UserDressedModel.self, from: response.data!)
                        debugPrint(dressResponse ?? "dress list bisey oldu")
                       
                        dump("Item + user pow\(dressResponse!.userPower)")
                        dump("Item + user health\(dressResponse!.userCurrentHealth)")
                        dump("Item + user def\(dressResponse!.userDefense)")
                        dump("Item + user speed\(dressResponse!.userSpeed)")
                       
                        dump("Only Item pow: \(dressResponse!.itemPower)")
                        dump("Only Item health: \(dressResponse!.itemHealth)")
                        dump("Only Item def: \(dressResponse!.itemDefense)")
                        dump("Only Item speed: \(dressResponse!.itemSpeed)")
                        
                        dressResponse?.dressed.forEach({ itemler in
                            switch itemler.shopName{
                                case "kask":
                                    let url = URL(string: itemler.image)!
                                    kaskImage.kf.setImage(with: url )
                                case "zırh":
                                    let url = URL(string: itemler.image)!
                                    zirhImage.kf.setImage(with: url )
                                case "silah":
                                    let url = URL(string: itemler.image)!
                                    silahImage.kf.setImage(with: url )
                                case "kalkan":
                                    let url = URL(string: itemler.image)!
                                    kalkanImage.kf.setImage(with: url )
                                case "kolye":
                                    let url = URL(string: itemler.image)!
                                    kolyeImage.kf.setImage(with: url )
                                case "eldiven":
                                    let url = URL(string: itemler.image)!
                                    eldivenImage.kf.setImage(with: url )
                                case "bot":
                                    let url = URL(string: itemler.image)!
                                    ayakkabiImage.kf.setImage(with: url )
                                    
                                
                                default:
                                    break
                            }
                            
                            
                            if( itemler.shopName == "kask" ){
                               
                            }
                        })
                       
                        
                        
                        
                       
                        
                    case let .failure(error):
                        print(error.errorDescription!)
                        print("hata")
                }
            }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadUserProfile()
        loadUserDressedItems()
    }
    

}

