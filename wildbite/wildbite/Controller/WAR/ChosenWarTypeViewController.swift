//
//  ChosenWarTypeViewController.swift
//  wildbite
//
//  Created by Yunus Gündüz on 6.05.2023.
//

import UIKit
import Alamofire
import Kingfisher


 

class ChosenWarTypeViewController: UIViewController {

    @IBOutlet weak var userHealthLabel: UILabel!
    @IBOutlet weak var userGoldLabel: UILabel!
    @IBOutlet weak var userEnergyLabel: UILabel!
    
    @IBOutlet weak var enemynameLabel: UILabel!
    @IBOutlet weak var enemyRole: UILabel!
    @IBOutlet weak var enemyLevel: UILabel!
    @IBOutlet weak var enemyDamage: UILabel!
    @IBOutlet weak var enemyPower: UILabel!
    @IBOutlet weak var enemyDefance: UILabel!
    @IBOutlet weak var enemySpeed: UILabel!
    @IBOutlet weak var enemyHealth: UILabel!
    
    @IBOutlet weak var enemyProfileImage: UIImageView!
    
    @IBOutlet weak var figgtButton: UIButton!
    
    @IBOutlet weak var againButton: UIButton!
    
    var powerDres = 0
    var defDres = 0
    var spdDres = 0
    var hlthDres = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    fileprivate func loadWarProfileEnemy() {
        
        let myUserID = UserDefaults.standard.value(forKey: "userID")
        
        let myUserToken = UserDefaults.standard.value(forKey: "userToken")
     
      
        print("User Id: \(myUserID!)")
        
        print("User Token: \(myUserToken!)")
     
        
        let token = "\(myUserToken!)"
        
        let headers: HTTPHeaders = [
            
            .authorization(bearerToken: token),
            .accept("application/json")
            
        ]
        
        
        let randomSayi = Int.random(in: 101...108)
        AF.request("http://backhub.site/wildbite/public/api/random-race-user?race=\(randomSayi))" , headers: headers )
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData { [self]  response in
                    //  debugPrint(response)
                
                switch response.result {
                case .success:
                    print("Validation Successful")
                    
                    let chosenWar = try? JSONDecoder().decode(ChosenWar.self, from: response.data!)
                    
                        
                    
                    print(chosenWar ?? "Choosen var hata oldu")
                   
                        if(chosenWar?.user == nil){
                            viewWillAppear(true)
                    }else{
                        
                        if let enemyID = chosenWar?.user.id{
                          
                            if(myUserID as! Int == enemyID){
                                viewWillAppear(true)}
                           
                        }
                       
                        // enemy name
                        if let enemyNamem = chosenWar?.user.name{
                            
                            enemynameLabel.text = "Name: \(enemyNamem)"
                        }
                     
                        // enemy level
                        if let enemyLevelm = chosenWar?.user.level{
                            
                            enemyLevel.text = "Level: \(enemyLevelm)"
                        }
                        //enemy Damage
                        if let enemyDamagem = chosenWar?.user.totalDamage{
                            
                            enemyDamage.text = "Damage: \(enemyDamagem)"
                        }
                        
                        
                        //enemy Health
                        if let enemyimagem = chosenWar?.user.image{
                            
                          let url = URL(string: "https://backhub.site/wildbite/image/user/idle/\(enemyimagem).gif")
                            DispatchQueue.main.async{ [self] in
                                enemyProfileImage.setGifFromURL(url!,showLoader: true)
                            }
                           
                            
                             
                        }
                        
                        
                        dump("chosenWarApi username: \(chosenWar!.user.name)")
                        dump("chosenWarApi userrole: \(chosenWar!.user.role)")
                        dump("chosenWarApi userexp: \(chosenWar!.user.exp)")
                        dump("chosenWarApi userlevel: \(chosenWar!.user.level)")
                        dump("chosenWarApi usergold: \(chosenWar!.user.gold)")
                        dump("chosenWarApi usercurenthealth: \(chosenWar!.user.currentHealth)")
                        dump("chosenWarApi usermaxhealth: \(chosenWar!.user.maximumHealth)")
                        dump("chosenWarApi usercurentenergy: \(chosenWar!.user.currentEnergy)")
                        
                     
                        dump("chosenWarApi usermaxenergy: \(chosenWar!.user.maximumEnergy)")
                      
                        dump("chosenWarApi userdamaga: \(chosenWar!.user.totalDamage)")
                        dump("chosenWarApi userpower: \(chosenWar!.user.power)")
                        dump("chosenWarApi userdefense: \(chosenWar!.user.defense)")
                        dump("chosenWarApi userspeed: \(chosenWar!.user.speed)")
                       // dump("Api userrace: \(myChoosenWartype)")
                        dump("chosenWarApi userimage: \(chosenWar!.user.image)")
                       
                         
                        UserDefaults.standard.set(chosenWar!.user.name, forKey: "WarSavunanUserName")
                        UserDefaults.standard.set(chosenWar!.user.role, forKey: "WarSavunanUserRole")
                        UserDefaults.standard.set(chosenWar!.user.exp, forKey: "WarSavunanUserExp")
                        UserDefaults.standard.set(chosenWar!.user.level, forKey: "WarSavunanUserLevel")
                        UserDefaults.standard.set(chosenWar!.user.gold, forKey: "WarSavunanUserGold")
                        UserDefaults.standard.set(chosenWar!.user.totalDamage, forKey: "WarSavunanUserTotalDamage")
                        UserDefaults.standard.set(chosenWar!.user.currentEnergy, forKey: "WarSavunanUserCurrentEnergy")
                        UserDefaults.standard.set(chosenWar!.user.maximumEnergy, forKey: "WarSavunanUserMaximumEnergy")
                        UserDefaults.standard.set(chosenWar!.user.maximumHealth, forKey: "WarSavunanUserMaximumHealth")
                  //      UserDefaults.standard.set(myChoosenWartype, forKey: "WarSavunanUserRacename")
                        UserDefaults.standard.set(chosenWar!.user.image, forKey: "WarSavunanUserImage")
                        
                        
                        loadUserDressedItems(userssID:  (chosenWar?.user.id)! )
                        
                    }
                   
                    
                    
                case let .failure(err):
                    print("Hata oldi")
                    print(err.errorDescription!)
                }
                
            }
    }
    @IBAction func againChooseButton(_ sender: Any) {
        againButton.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [self] in
            againButton.isHidden = false
            saldiranUserProfileLoaD()
        }
   
        
        
      
       
       
        /*
        let WarSaldiranUserName = UserDefaults.standard.string(forKey: "WarSaldiranUserName")
        let WarSaldiranUserRole = UserDefaults.standard.integer(forKey: "WarSaldiranUserRole")
        let WarSaldiranUserExp = UserDefaults.standard.integer(forKey: "WarSaldiranUserExp")
        let WarSaldiranUserLevel = UserDefaults.standard.integer(forKey: "WarSaldiranUserLevel")
        let WarSaldiranUserGold = UserDefaults.standard.integer(forKey: "WarSaldiranUserGold")
        let WarSaldiranUserCurrentHealth = UserDefaults.standard.integer(forKey: "WarSaldiranUserCurrentHealth")
        let WarSaldiranUserMaximumHealth = UserDefaults.standard.integer(forKey: "WarSaldiranUserMaximumHealth")
         
        let WarSaldiranUserMaximumEnergy = UserDefaults.standard.integer(forKey: "WarSaldiranUserMaximumEnergy")
      
        let WarSaldiranUserNightMissionState = UserDefaults.standard.integer(forKey: "WarSaldiranUserNightMissionState")
        let WarSaldiranUserTotalDamage = UserDefaults.standard.integer(forKey: "WarSaldiranUserTotalDamage")
        let WarSaldiranUserPower = UserDefaults.standard.integer(forKey: "WarSaldiranUserPower")
        let WarSaldiranUserDefense = UserDefaults.standard.integer(forKey: "WarSaldiranUserDefense")
        let WarSaldiranUserSpeed = UserDefaults.standard.integer(forKey: "WarSaldiranUserSpeed")
        let WarSaldiranUserRacename = UserDefaults.standard.integer(forKey: "WarSaldiranUserRacename")
         */ 
        let WarSaldiranUserNightMissionState = UserDefaults.standard.integer(forKey: "WarSaldiranUserNightMissionState")
        let WarSaldiranUserCurrentEnergy = UserDefaults.standard.integer(forKey: "WarSaldiranUserCurrentEnergy")
        let usertoken = UserDefaults.standard.string(forKey: "userToken")
        // api  start
       let headers: HTTPHeaders = [
           .authorization(bearerToken: usertoken!),
           .accept("application/json")
       ]
       
        
        let nightMissionParameters = NightMissionYapi(gold: 0, current_health: 0, maximum_health: 0, current_energy: -1, maximum_energy: 0, level: 0, night_mission_state: "\(WarSaldiranUserNightMissionState)", exp: 0 )
        
      AF.request("https://backhub.site/wildbite/public/api/night-mission",
                 method: .put,
                 parameters: nightMissionParameters,
                 headers: headers)
      .validate(statusCode: 200..<500)
      .validate(contentType: ["application/json"])
      .responseData {  response in
          debugPrint(response)
          switch response.result {
          case .success:
                  let NightMissionresponse = try? JSONDecoder().decode(NightMissionModel.self,  from: response.data!)
                  debugPrint(NightMissionresponse ?? "NightMissionresponse hata oldu " )
                  UserDefaults.standard.set(WarSaldiranUserCurrentEnergy - 1, forKey: "WarSaldiranUserCurrentEnergy")
                  self.loadWarProfileEnemy()
                  
          case let .failure(error):
              print(error.errorDescription!)
              print("hata")
          }
      }
    // api end
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
        loadWarProfileEnemy()
   
    
       
        saldiranUserProfileLoaD()
       
    }
    
    
    func  saldiranUserProfileLoaD() {
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
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData { [self]  response in
                
                
                switch response.result {
                case .success:
                    print("Validation Successful")
                    
                    let profileModelresponse = try? JSONDecoder().decode(ProfileModel.self, from: response.data!)
                    debugPrint(profileModelresponse ?? "profil dönen mesajda hata oldu nil galiba")
                        if(profileModelresponse == nil){break}
                        UserDefaults.standard.set(profileModelresponse!.user.name, forKey: "WarSaldiranUserName")
                        UserDefaults.standard.set(profileModelresponse!.user.role, forKey: "WarSaldiranUserRole")
                        UserDefaults.standard.set(profileModelresponse!.user.exp, forKey: "WarSaldiranUserExp")
                        UserDefaults.standard.set(profileModelresponse!.user.level, forKey: "WarSaldiranUserLevel")
                        UserDefaults.standard.set(profileModelresponse!.user.gold, forKey: "WarSaldiranUserGold")
                        UserDefaults.standard.set(profileModelresponse!.user.currentHealth, forKey: "WarSaldiranUserCurrentHealth")
                        UserDefaults.standard.set(profileModelresponse!.user.maximumHealth, forKey: "WarSaldiranUserMaximumHealth")
                        UserDefaults.standard.set(profileModelresponse!.user.currentEnergy, forKey: "WarSaldiranUserCurrentEnergy")
                        UserDefaults.standard.set(profileModelresponse!.user.maximumEnergy, forKey: "WarSaldiranUserMaximumEnergy")
                        UserDefaults.standard.set(profileModelresponse!.user.night_mission_state, forKey: "WarSaldiranUserNightMissionState")
                        UserDefaults.standard.set(profileModelresponse!.user.totalDamage, forKey: "WarSaldiranUserTotalDamage")
                        UserDefaults.standard.set(profileModelresponse!.user.power, forKey: "WarSaldiranUserPower")
                        UserDefaults.standard.set(profileModelresponse!.user.defense, forKey: "WarSaldiranUserDefense")
                        UserDefaults.standard.set(profileModelresponse!.user.speed, forKey: "WarSaldiranUserSpeed")
                        UserDefaults.standard.set(profileModelresponse!.race.raceName, forKey: "WarSaldiranUserRacename")
                        UserDefaults.standard.set(profileModelresponse!.user.image, forKey: "WarSaldiranUserImage")
                 
                  
                        userGoldLabel.text = "\(profileModelresponse!.user.gold)"
                        userEnergyLabel.text = "\(profileModelresponse!.user.currentEnergy)"
                        userHealthLabel.text = "\(profileModelresponse!.user.currentHealth)"
                 
                        UserDefaults.standard.set(profileModelresponse!.user.currentEnergy, forKey: "WarSaldiranUserCurrentEnergy")
                   
                 
                        
                        if(Int(profileModelresponse!.user.currentEnergy)! >= 1){
                            againButton.isEnabled = true
                            print("Againbutton on")
                            if(Int(profileModelresponse!.user.currentEnergy)! >= 10){
                                 figgtButton.isEnabled = true
                                print("figgtButton on")
                            }else{
                                 
                                figgtButton.isEnabled = false
                                print("figgtButton off")
                            }
                        }else{
                            againButton.isEnabled = false
                            figgtButton.isEnabled = false
                            print("againButton off")
                            print("figgtButton off")
                        }
                  
              
                   
                    
                case let .failure(error):
                    print(error.errorDescription!)
                    print("hata")
                }
            }
    }
    
    
    
  fileprivate  func loadUserDressedItems(userssID:Int){
      dump("-------------asdasd-----------\(userssID)")
        let myUserToken = UserDefaults.standard.value(forKey: "userToken")
       
        
        let token = "\(myUserToken!)"
        
        let headers: HTTPHeaders = [
            
            .authorization(bearerToken: token),
            .accept("application/json")
            
        ]
     
        AF.request("http://backhub.site/wildbite/public/api/dressed-enemy/\(userssID)" , headers: headers )
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData { [self]   response in
               
                
                switch response.result {
                    case .success:
                        print("DEBUG: dress list Successful ")
                        
                        let dressResponse = try? JSONDecoder().decode(UserDressedModel.self, from: response.data!)
                        debugPrint(dressResponse ?? "dress list bisey oldu")
                        if(dressResponse == nil){
                           return loadWarProfileEnemy()
                        }
                        dump("Item + user pow\(dressResponse?.userPower ?? 0)")
                        dump("Item + user health\(dressResponse?.userCurrentHealth  ?? 0)")
                        dump("Item + user def\(dressResponse?.userDefense  ?? 0)")
                        dump("Item + user speed\(dressResponse?.userSpeed  ?? 0)")
                       
                        dump("Only Item pow: \(dressResponse?.itemPower  ?? 0)")
                        dump("Only Item health: \(dressResponse?.itemHealth  ?? 0)")
                        dump("Only Item def: \(dressResponse?.itemDefense  ?? 0)")
                        dump("Only Item speed: \(dressResponse?.itemSpeed  ?? 0)")
                        //enemy Power
                        if let enemyPowerm = dressResponse?.userPower{
                            
                            enemyPower.text = "Power: \(enemyPowerm)"
                            
                             UserDefaults.standard.set(enemyPowerm, forKey: "WarSavunanUserPower")
                        }
                        
                        //enemy Defence
                        if let enemyDefensem = dressResponse?.userDefense{
                            UserDefaults.standard.set(enemyDefensem, forKey: "WarSavunanUserDefense")
                            enemyDefance.text = "Defense: \(enemyDefensem)"
                        }
                        
                        //enemy Speed
                        if let enemySpeedm = dressResponse?.userSpeed{
                            UserDefaults.standard.set(enemySpeedm, forKey: "WarSavunanUserSpeed")
                            enemySpeed.text = "Speed: \(enemySpeedm)"
                        }
                     
                        //enemy Health
                        if let enemyHealthm = dressResponse?.userCurrentHealth{
                           
                          enemyHealth.text = "Health: \(enemyHealthm)"
                            UserDefaults.standard.set(enemyHealthm, forKey: "WarSavunanUserCurrentHealth")
                           
                        }
      
                        
                      
                       
                        
                      
                    case let .failure(error):
                        print(error.errorDescription!)
                        print("hata")
                }
            }
    }
     


    
    }

