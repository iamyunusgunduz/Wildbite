//
//  WARViewController.swift
//  wildbite
//
//  Created by Yunus Gündüz on 5.05.2023.
//

import UIKit
import Alamofire

class WARViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func randomWarButton(_ sender: Any) {
        performSegue(withIdentifier: "warToChosenPage", sender: nil)
        let random = Int.random(in: 1...4)
        
        UserDefaults.standard.set(random, forKey: "choosenWartype")
        UserDefaults.standard.set("random", forKey: "choosenWarNumber")
    }
    
    
    @IBAction func vampireWarButton(_ sender: Any) {
        performSegue(withIdentifier: "warToChosenPage", sender: nil)
        UserDefaults.standard.set(3, forKey: "choosenWartype")
        UserDefaults.standard.set("3", forKey: "choosenWarNumber")
    }
    
    @IBAction func werewolfWarButton(_ sender: Any) {
        performSegue(withIdentifier: "warToChosenPage", sender: nil)
        UserDefaults.standard.set(2, forKey: "choosenWartype")
        UserDefaults.standard.set("2", forKey: "choosenWarNumber")
    }
    
    @IBAction func hunterWarButton(_ sender: Any) {
        performSegue(withIdentifier: "warToChosenPage", sender: nil)
        UserDefaults.standard.set(1, forKey: "choosenWartype")
        UserDefaults.standard.set("1", forKey: "choosenWarNumber")
    }
    
    @IBAction func WitchWarButton(_ sender: Any) {
        performSegue(withIdentifier: "warToChosenPage", sender: nil)
        UserDefaults.standard.set(4, forKey: "choosenWartype")
        UserDefaults.standard.set("4", forKey: "choosenWarNumber")
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
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData {  response in
                
                
                switch response.result {
                case .success:
                    print("Validation Successful")
                    
                    let profileModelresponse = try? JSONDecoder().decode(ProfileModel.self, from: response.data!)
                    debugPrint(profileModelresponse ?? "profil dönen mesajda hata oldu nil galiba")
                        dump("Api username: \(profileModelresponse!.user.name)")
                        dump("Api userrole: \(profileModelresponse!.user.role)")
                        dump("Api userexp: \(profileModelresponse!.user.exp)")
                        dump("Api userlevel: \(profileModelresponse!.user.level)")
                        dump("Api usergold: \(profileModelresponse!.user.gold)")
                        dump("Api usercurenthealth: \(profileModelresponse!.user.currentHealth)")
                        dump("Api usermaxhealth: \(profileModelresponse!.user.maximumHealth)")
                        dump("Api usercurentenergy: \(profileModelresponse!.user.currentEnergy)")
                        dump("Api usermaxenergy: \(profileModelresponse!.user.maximumEnergy)")
                        dump("Api nightmissionState: \(profileModelresponse!.user.night_mission_state)")
                        dump("Api userdamaga: \(profileModelresponse!.user.totalDamage)")
                        dump("Api userpower: \(profileModelresponse!.user.power)")
                        dump("Api userdefense: \(profileModelresponse!.user.defense)")
                        dump("Api userspeed: \(profileModelresponse!.user.speed)")
                        dump("Api userrace: \(profileModelresponse!.race.raceName)")
                        dump("Api userimage: \(profileModelresponse!.user.image)")
                       
                        
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
                  
                     
                 
                 
                   
                 
                    
                  
              
                   
                    
                case let .failure(error):
                    print(error.errorDescription!)
                    print("hata")
                }
            }
    }
}
