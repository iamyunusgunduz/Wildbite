//
//  UserProfileViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 29.03.2023.
//

import UIKit
import Alamofire
import Kingfisher
import SwiftyGif

class ItemFetch {
    var itemimage = ""
    var itemname = ""
    var itemprice = ""
    var itemlevel = ""

}


class UserProfileViewController: UIViewController {
  
    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var userRaceImageView: UIImageView!
    

    @IBOutlet weak var kaskImage: UIImageView!
    @IBOutlet weak var zirhImage: UIImageView!
    @IBOutlet weak var silahImage: UIImageView!
    @IBOutlet weak var kalkanImage: UIImageView!
    @IBOutlet weak var takiImage: UIImageView!
    @IBOutlet weak var eldivenImage: UIImageView!
    @IBOutlet weak var ayakkabiImage: UIImageView!
    @IBOutlet weak var kemerImage: UIImageView!
    @IBOutlet weak var pantolonImage: UIImageView!
    
 
    
    
    // https://yunusgunduz.site/wildbite/image/race/148.png
 

    
    @IBOutlet weak var userEnerjiLabel: UILabel!
    
    @IBOutlet weak var userCanLabel: UILabel!
    
    @IBOutlet weak var userGoldLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background2.png")!)
        /*
        //kask image
        let tapKask = UITapGestureRecognizer(target: self, action: #selector(self.tappedKask))
        kaskImage.addGestureRecognizer(tapKask)
        kaskImage.isUserInteractionEnabled = true
        //silah image
        let tapSilah = UITapGestureRecognizer(target: self, action: #selector(self.tappedSilah))
        silahImage.addGestureRecognizer(tapSilah)
        silahImage.isUserInteractionEnabled = true
        //zirh image
        let tapZirh = UITapGestureRecognizer(target: self, action: #selector(self.tappedZirh))
        zirhImage.addGestureRecognizer(tapZirh)
        zirhImage.isUserInteractionEnabled = true
        //kalkan image
        let tapKalkan = UITapGestureRecognizer(target: self, action: #selector(self.tappedKalkan))
        kalkanImage.addGestureRecognizer(tapKalkan)
        kalkanImage.isUserInteractionEnabled = true
        //eldıven image
        let tapEldiven = UITapGestureRecognizer(target: self, action: #selector(self.tappedEldiven))
        eldivenImage.addGestureRecognizer(tapEldiven)
        eldivenImage.isUserInteractionEnabled = true
        //kolye image
        let tapKolye = UITapGestureRecognizer(target: self, action: #selector(self.tappedKolye))
        kolyeImage.addGestureRecognizer(tapKolye)
        kolyeImage.isUserInteractionEnabled = true
        //ayakkabi image
        let tapAyakkabi = UITapGestureRecognizer(target: self, action: #selector(self.tappedAyakkabi))
        ayakkabiImage.addGestureRecognizer(tapAyakkabi)
        ayakkabiImage.isUserInteractionEnabled = true
        */
    }
    
    
    
    @objc func tappedKask()
    {
         
        performSegue(withIdentifier: "dresseditemDetails", sender: nil)
        UserDefaults.standard.set("kask", forKey: "DressedItemTap")
    }
    @objc func tappedSilah()
    {
         
        performSegue(withIdentifier: "dresseditemDetails", sender: nil)
        UserDefaults.standard.set("silah", forKey: "DressedItemTap")
    }
    @objc func tappedZirh()
    {
         
        performSegue(withIdentifier: "dresseditemDetails", sender: nil)
        UserDefaults.standard.set("zirh", forKey: "DressedItemTap")
    }
    @objc func tappedKalkan()
    {
         
        performSegue(withIdentifier: "dresseditemDetails", sender: nil)
        UserDefaults.standard.set("kalkan", forKey: "DressedItemTap")
    }
    @objc func tappedEldiven()
    {
         
        performSegue(withIdentifier: "dresseditemDetails", sender: nil)
        UserDefaults.standard.set("eldiven", forKey: "DressedItemTap")
    }
    @objc func tappedKolye()
    {
         
        performSegue(withIdentifier: "dresseditemDetails", sender: nil)
        UserDefaults.standard.set("kolye", forKey: "DressedItemTap")
    }
    @objc func tappedAyakkabi()
    {
         
        performSegue(withIdentifier: "dresseditemDetails", sender: nil)
        UserDefaults.standard.set("ayakkabi", forKey: "DressedItemTap")
    }
    

    
    
    
    
    
    fileprivate func loadUserProfile() {
        let myUserID = UserDefaults.standard.value(forKey: "userID")
        let myUserName = UserDefaults.standard.value(forKey: "userName")
        let myUserToken = UserDefaults.standard.value(forKey: "userToken")
        print("User Id: \(myUserID ?? 0 )")
        print("User Name: \(myUserName ?? 0)")
        print("User Token: \(myUserToken ?? 0)")
        
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
                     //   debugPrint(profileModelresponse!)
                        
                        print("Debug: Race settings\(profileModelresponse!.race.raceName)")
                      
                        let urlRace = URL(string: "https://yunusgunduz.site/wildbite/image/race/\(profileModelresponse!.race.raceName).png")
                        print("Race: \(profileModelresponse!.race.raceName)")
                        DispatchQueue.main.async{ [self] in  userRaceImageView.kf.setImage(with: urlRace)    }
                        userEnerjiLabel.text = "\(profileModelresponse?.user.currentEnergy ?? "none")/\(profileModelresponse?.user.maximumEnergy ?? "none")"
                        userCanLabel.text = "\(profileModelresponse?.user.currentHealth ?? "none")/\(profileModelresponse?.user.maximumHealth ?? "none")"
                        userGoldLabel.text = "\(profileModelresponse?.user.gold ?? "none")"
                        
                        let url = URL(string: "https://yunusgunduz.site/wildbite/image/user/idle/\(profileModelresponse!.user.image).gif")
                        let url2 = URL(string: "https://yunusgunduz.site/wildbite/image/user/idle/00.gif")!
                        
                        print("Image url : \(url ?? url2)")
                     //   userProfileImageView.kf.setImage(with: url ?? url2)
                      
                    
                       
                    self.userProfileImageView.setGifFromURL(URL(string: "\(url ?? url2)")!)
                        
                        
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
                       
                        dump("Item + user pow\(dressResponse?.userPower ?? 0)")
                        dump("Item + user health\(dressResponse?.userCurrentHealth  ?? 0)")
                        dump("Item + user def\(dressResponse?.userDefense  ?? 0)")
                        dump("Item + user speed\(dressResponse?.userSpeed  ?? 0)")
                       
                        dump("Only Item pow: \(dressResponse?.itemPower  ?? 0)")
                        dump("Only Item health: \(dressResponse?.itemHealth  ?? 0)")
                        dump("Only Item def: \(dressResponse?.itemDefense  ?? 0)")
                        dump("Only Item speed: \(dressResponse?.itemSpeed  ?? 0)")
                     
                        dressResponse?.dressed.forEach({ itemler in
                            
                
                            
                           
                            switch itemler.shopName{
                                   
                                                  
                                case "STANDART Ayakkabı Kasası":
                                                   let urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/ayakkabi/AyakkabiGold/\(itemler.image).png")!
                                   
                                                    DispatchQueue.main.async{ [self] in  self.ayakkabiImage.kf.setImage(with: urlImage)    }
                                   
                                   print("asd")
                                    
                                case "PREMIUM Ayakkabı Kasası":
                                    let  urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/ayakkabi/AyakkabiDiamond/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.ayakkabiImage.kf.setImage(with: urlImage)    }
                                   
                                                   case "STANDART Eldiven Kasası":
                                    let       urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/eldiven/EldivenGold/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.eldivenImage.kf.setImage(with: urlImage)    }
                                                        
                                                   case "PREMIUM Eldiven Kasası":
                                    let      urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/eldiven/EldivenDiamond/\(itemler.image).png")!
                                                DispatchQueue.main.async{ [self] in  eldivenImage.kf.setImage(with: urlImage)    }
                                                
                                                   case "STANDART Kalkan Kasası":
                                    let   urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/kalkan/KalkanGold/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.kalkanImage.kf.setImage(with: urlImage)    }
                                                      
                                                   case "PREMIUM Kalkan Kasası":
                                    let  urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/kalkan/KalkanDiamond/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.kalkanImage.kf.setImage(with: urlImage)    }
                                                       
                                                   case "STANDART Kask Kasası":
                                    let urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/kask/KaskGold/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.kaskImage.kf.setImage(with: urlImage)    }
                                                       
                                                   case "PREMIUM Kask Kasası":
                                    let   urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/kask/KaskDiamond/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.kaskImage.kf.setImage(with: urlImage)    }
                                                      
                                                   case "STANDART Kemer Kasası":
                                    let     urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/kemer/KemerGold/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.kemerImage.kf.setImage(with: urlImage)    }
                                                       
                                                   case "PREMIUM Kemer Kasası":
                                    let     urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/kemer/KemerDiamond/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.kemerImage.kf.setImage(with: urlImage)    }
                                                       
                                                   case "STANDART Pantolon Kasası":
                                    let     urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/pantolon/PantolonGold/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.pantolonImage.kf.setImage(with: urlImage)    }
                                                      
                                                   case "PREMIUM Pantolon Kasası":
                                    let       urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/pantolon/PantolonDiamond/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.pantolonImage.kf.setImage(with: urlImage)    }
                                                       
                                                   case "STANDART Takı Kasası":
                                    let   urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/taki/TakiGold/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.takiImage.kf.setImage(with: urlImage)    }
                                                       
                                                   case "PREMIUM Takı Kasası":
                                    let     urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/taki/TakiDiamond/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.takiImage.kf.setImage(with: urlImage)    }
                                                      
                                                   case "STANDART Zırh Kasası":
                                    let  urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/zirh/ZirhGold/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.zirhImage.kf.setImage(with: urlImage)    }
                                                       
                                                   case "PREMIUM Zırh Kasası":
                                    let   urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/zirh/ZirhDiamond/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.zirhImage.kf.setImage(with: urlImage)    }
                                                       
                                                   case "STANDART Asa Kasası":
                                    let   urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/asa/AsaGold/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.silahImage.kf.setImage(with: urlImage)    }
                                                      
                                                   case "PREMIUM Asa Kasası":
                                    let  urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/asa/AsaDiamond/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.silahImage.kf.setImage(with: urlImage)    }
                                                       
                                                   case "STANDART Balta Kasası":
                                    let    urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/balta/BaltaGold/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.silahImage.kf.setImage(with: urlImage)    }
                                                       
                                                   case "PREMIUM Balta Kasası":
                                    let   urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/balta/BaltaDiamond/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.silahImage.kf.setImage(with: urlImage)    }
                                                      
                                                   case "STANDART Balyoz Kasası":
                                    let  urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/balyoz/BalyozGold/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.silahImage.kf.setImage(with: urlImage)    }
                                                       
                                                   case "PREMIUM Balyoz Kasası":
                                    let   urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/balyoz/BalyozDiamond/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.silahImage.kf.setImage(with: urlImage)    }
                                                       
                                                   case "STANDART Kılıç Kasası":
                                    let   urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/kilic/KilicGold/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.silahImage.kf.setImage(with: urlImage)    }
                                                      
                                                   case "PREMIUM Kılıç Kasası":
                                    let  urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/kilic/KilicDiamond/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.silahImage.kf.setImage(with: urlImage)    }
                                                       
                                                   case "STANDART Mızrak Kasası":
                                    let     urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/mizrak/MizrakGold/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.silahImage.kf.setImage(with: urlImage)    }
                                                       
                                                   case "PREMIUM Mızrak Kasası":
                                    let     urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/mizrak/MizrakDiamond/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.silahImage.kf.setImage(with: urlImage)    }
                                                       
                                                   case "STANDART Yay/Arbalet Kasası":
                                    let   urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/yayArbalet/YayArbaletGold/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.silahImage.kf.setImage(with: urlImage)    }
                                                        
                                                   case "PREMIUM Yay/Arbalet Kasası":
                                    let   urlImage = URL(string: "https://yunusgunduz.site/wildbite/image/Items/yayArbalet/YayArbaletDiamond/\(itemler.image).png")!
                                                       DispatchQueue.main.async{ [self] in  self.silahImage.kf.setImage(with: urlImage)    }
                                                       
                                                   
                                                       
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

