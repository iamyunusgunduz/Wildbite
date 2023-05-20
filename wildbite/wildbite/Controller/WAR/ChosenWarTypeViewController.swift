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
    
    override func viewDidLoad() {
        super.viewDidLoad()

         
    }
    
    fileprivate func loadWarProfileEnemy() {
        
        let myUserID = UserDefaults.standard.value(forKey: "userID")
        
        let myUserToken = UserDefaults.standard.value(forKey: "userToken")
        let myChoosenWartype = UserDefaults.standard.value(forKey: "choosenWartype") as! Int
        let WarSaldiranUserCurrentEnergy = UserDefaults.standard.integer(forKey: "WarSaldiranUserCurrentEnergy")
        if(WarSaldiranUserCurrentEnergy >= 1){
            againButton.isEnabled = true
            if(WarSaldiranUserCurrentEnergy >= 10){
                 figgtButton.isEnabled = true
            }else{
                 
                figgtButton.isEnabled = false
            }
        }else{
            againButton.isEnabled = false
            figgtButton.isEnabled = false
        }
        print("User Id: \(myUserID!)")
        
        print("User Token: \(myUserToken!)")
        print("User myChoosenWartype: \(myChoosenWartype)")
        
        let token = "\(myUserToken!)"
        
        let headers: HTTPHeaders = [
            
            .authorization(bearerToken: token),
            .accept("application/json")
            
        ]
        
        
        
        AF.request("http://yunusgunduz.site/wildbite/public/api/random-race-user?race=\(myChoosenWartype))" , headers: headers )
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData { [self]  response in
                debugPrint(response)
                
                switch response.result {
                case .success:
                    print("Validation Successful")
                    
                    let chosenWar = try? JSONDecoder().decode(ChosenWar.self, from: response.data!)
                    
                    
                    
                    
                    print(chosenWar ?? "Choosen var hata oldu")
                   
                    if(chosenWar == nil){
                        loadWarProfileEnemy()
                    }else{
                        
                        if let enemyID = chosenWar?.user.id{
                            
                            if(myUserID as! Int == enemyID){
                                loadWarProfileEnemy()
                            }
                         
                        }
                        // enemy name
                        if let enemyNamem = chosenWar?.user.name{
                            
                            enemynameLabel.text = "Name: \(enemyNamem)"
                        }
                        // enemy Type
                        
                            switch myChoosenWartype {
                                case 1:
                                    enemyRole.text = "Race: HUNTER "
                                case 2:
                                    enemyRole.text = "Race: WEREWOLF "
                                case 3:
                                    enemyRole.text = "Race: VAMPIRE "
                                case 4:
                                    enemyRole.text = "Race: WITCH "
                                default:
                                    enemyRole.text = "-"
                            }
                           
                        
                        // enemy level
                        if let enemyLevelm = chosenWar?.user.level{
                            
                            enemyLevel.text = "Level: \(enemyLevelm)"
                        }
                        //enemy Damage
                        if let enemyDamagem = chosenWar?.user.totalDamage{
                            
                            enemyDamage.text = "Damage: \(enemyDamagem)"
                        }
                        
                        //enemy Power
                        if let enemyPowerm = chosenWar?.user.power{
                            
                            enemyPower.text = "Power: \(enemyPowerm)"
                        }
                        
                        //enemy Defence
                        if let enemyDefensem = chosenWar?.user.defense{
                            
                            enemyDefance.text = "Defense: \(enemyDefensem)"
                        }
                        
                        //enemy Speed
                        if let enemySpeedm = chosenWar?.user.speed{
                            
                            enemySpeed.text = "Speed: \(enemySpeedm)"
                        }
                        
                        //enemy Health
                        if let enemyHealthm = chosenWar?.user.maximumHealth{
                            
                            enemyHealth.text = "Health: \(enemyHealthm)"
                        }
                        //enemy Health
                        if let enemyimagem = chosenWar?.user.image{
                            
                            let url = URL(string: "\(enemyimagem)")
                            DispatchQueue.main.async{ [self] in
                                enemyProfileImage.kf.setImage(with: url)
                            }
                           
                            
                             
                        }
                        
                        
                        dump("Api username: \(chosenWar!.user.name)")
                        dump("Api userrole: \(chosenWar!.user.role)")
                        dump("Api userexp: \(chosenWar!.user.exp)")
                        dump("Api userlevel: \(chosenWar!.user.level)")
                        dump("Api usergold: \(chosenWar!.user.gold)")
                        dump("Api usercurenthealth: \(chosenWar!.user.currentHealth)")
                        dump("Api usermaxhealth: \(chosenWar!.user.maximumHealth)")
                        dump("Api usercurentenergy: \(chosenWar!.user.currentEnergy)")
                        
                     
                        dump("Api usermaxenergy: \(chosenWar!.user.maximumEnergy)")
                      
                        dump("Api userdamaga: \(chosenWar!.user.totalDamage)")
                        dump("Api userpower: \(chosenWar!.user.power)")
                        dump("Api userdefense: \(chosenWar!.user.defense)")
                        dump("Api userspeed: \(chosenWar!.user.speed)")
                        dump("Api userrace: \(myChoosenWartype)")
                        dump("Api userimage: \(chosenWar!.user.image)")
                       
                        
                        UserDefaults.standard.set(chosenWar!.user.name, forKey: "WarSavunanUserName")
                        UserDefaults.standard.set(chosenWar!.user.role, forKey: "WarSavunanUserRole")
                        UserDefaults.standard.set(chosenWar!.user.exp, forKey: "WarSavunanUserExp")
                        UserDefaults.standard.set(chosenWar!.user.level, forKey: "WarSavunanUserLevel")
                        UserDefaults.standard.set(chosenWar!.user.gold, forKey: "WarSavunanUserGold")
                        UserDefaults.standard.set(chosenWar!.user.currentHealth, forKey: "WarSavunanUserCurrentHealth")
                        UserDefaults.standard.set(chosenWar!.user.maximumHealth, forKey: "WarSavunanUserMaximumHealth")
                        UserDefaults.standard.set(chosenWar!.user.currentEnergy, forKey: "WarSavunanUserCurrentEnergy")
                        UserDefaults.standard.set(chosenWar!.user.maximumEnergy, forKey: "WarSavunanUserMaximumEnergy")
                     
                        UserDefaults.standard.set(chosenWar!.user.totalDamage, forKey: "WarSavunanUserTotalDamage")
                        UserDefaults.standard.set(chosenWar!.user.power, forKey: "WarSavunanUserPower")
                        UserDefaults.standard.set(chosenWar!.user.defense, forKey: "WarSavunanUserDefense")
                        UserDefaults.standard.set(chosenWar!.user.speed, forKey: "WarSavunanUserSpeed")
                        UserDefaults.standard.set(myChoosenWartype, forKey: "WarSavunanUserRacename")
                        UserDefaults.standard.set(chosenWar!.user.image, forKey: "WarSavunanUserImage")
                        
                        
                        
                        
                    }
                   
                    
                    
                case let .failure(err):
                    print("Hata oldi")
                    print(err.errorDescription!)
                }
                
            }
    }
    @IBAction func againChooseButton(_ sender: Any) {
        self.againButton.isHidden = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.againButton.isHidden = false
        }
   
        let myChoosenNumber = UserDefaults.standard.value(forKey: "choosenWarNumber")
        if(myChoosenNumber as! String == "random" ){
            let random = Int.random(in: 1...4)
            
            UserDefaults.standard.set(random, forKey: "choosenWartype")
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
        
      AF.request("https://yunusgunduz.site/wildbite/public/api/night-mission",
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
        let nightMissionType = UserDefaults.standard.integer(forKey: "NightMissionType")
        dump("nightMissionType: \(nightMissionType)")
        let WarSaldiranUserCurrentEnergy = UserDefaults.standard.integer(forKey: "WarSaldiranUserCurrentEnergy")
        if(WarSaldiranUserCurrentEnergy >= 1){
            againButton.isEnabled = true
            if(WarSaldiranUserCurrentEnergy >= 10){
                 figgtButton.isEnabled = true
            }else{
                 
                figgtButton.isEnabled = false
            }
        }else{
            againButton.isEnabled = false
            figgtButton.isEnabled = false
        }
       
    }
    }
   
    


