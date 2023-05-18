//
//  NightMissionCaseViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 10.04.2023.
//

import UIKit
import Alamofire
import Kingfisher

class NightMissionCaseViewController: UIViewController {

    @IBOutlet weak var huntName: UILabel!
    @IBOutlet weak var huntHealth: UILabel!
   
    
    @IBOutlet weak var huntResult: UILabel!
    @IBOutlet weak var attactButton: UIButton!
    @IBOutlet weak var huntPow: UILabel!
    
    
    @IBOutlet weak var missionMonsterImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func attackButton(_ sender: Any) {
        let nightMissionType = UserDefaults.standard.integer(forKey: "NightMissionType")
        
        let NightMissionUserLevel = UserDefaults.standard.integer(forKey: "NightMissionUserLevel")
        let NightMissionUserName = UserDefaults.standard.string(forKey: "NightMissionUserName")
        let NightMissionUserTotalDamage = UserDefaults.standard.integer(forKey: "NightMissionUserTotalDamage")
      //  let NightMissionUserTotalDamage = 99999999
        let NightMissionUserHealth = UserDefaults.standard.integer(forKey: "NightMissionUserHealth")
        let NightMissionUserEnergy = UserDefaults.standard.integer(forKey: "NightMissionUserEnergy")
        
      
        let usertoken = UserDefaults.standard.string(forKey: "userToken")
    
        
        // savas kismi

            if(NightMissionUserTotalDamage >= nightMissionType * 10){ // kazanma durumu
               

                // api  start
               let headers: HTTPHeaders = [
                   .authorization(bearerToken: usertoken!),
                   .accept("application/json")
               ]
                let kazanilanGold = nightMissionType * 100
                let kazanilanCan = nightMissionType * 10
                let kazanilanExp = nightMissionType * 3
                let kazanilanEnergy = nightMissionType * 9
                
                let nightMissionParameters = NightMissionYapi(gold: kazanilanGold, current_health: kazanilanCan, maximum_health: kazanilanCan, current_energy: kazanilanEnergy, maximum_energy: kazanilanEnergy, level: 0, night_mission_state: "\(nightMissionType+1)", exp: kazanilanExp )
                
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
                          debugPrint(NightMissionresponse!)
                          self.attactButton.isHidden = true
                          self.huntResult.text = "Av Başarılı: \n +\(kazanilanCan) Can \n +\(kazanilanExp) Exp \n +\(kazanilanGold) Gold \n +\(kazanilanEnergy) Enerji"
                          self.huntResult.textColor = UIColor.systemGreen
                  case let .failure(error):
                      print(error.errorDescription!)
                      print("hata")
                  }
              }
            // api end
                
            }else{ // kaybetme durumu
                attactButton.isHidden = false
                
                // api  start
               let headers: HTTPHeaders = [
                   .authorization(bearerToken: usertoken!),
                   .accept("application/json")
               ]
                let kazanilanGold = nightMissionType * 100
                let kazanilanCan = nightMissionType * 10
                let kazanilanExp = nightMissionType * 3
                let kazanilanEnergy = nightMissionType * 3
                
                let nightMissionParameters = NightMissionYapi(gold: -kazanilanGold, current_health: -kazanilanCan, maximum_health: 0, current_energy: -kazanilanEnergy, maximum_energy: 0, level: 0, night_mission_state: "\(nightMissionType)", exp: 0 )
                
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
                          debugPrint(NightMissionresponse!)
                          
                          self.huntResult.text = "Av Başarısız: \n -\(kazanilanCan) Can \n -\(kazanilanExp) Exp \n -\(kazanilanGold) Gold \n -\(kazanilanEnergy) Enerji"
                          self.huntResult.textColor = UIColor.systemRed
                          
                  case let .failure(error):
                      print(error.errorDescription!)
                      print("hata")
                  }
              }
            // api end
                
                
            }
     

        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
     
        let nightMissionType = UserDefaults.standard.integer(forKey: "NightMissionType")
        
        let NightMissionUserLevel = UserDefaults.standard.integer(forKey: "NightMissionUserLevel")
        let NightMissionUserName = UserDefaults.standard.string(forKey: "NightMissionUserName")
        let NightMissionUserTotalDamage = UserDefaults.standard.integer(forKey: "NightMissionUserTotalDamage")
        let NightMissionUserHealth = UserDefaults.standard.integer(forKey: "NightMissionUserHealth")
        let NightMissionUserEnergy = UserDefaults.standard.integer(forKey: "NightMissionUserEnergy")
        
        dump("User Total Damage : \(NightMissionUserTotalDamage)")
        dump("User missionYapilabilmedurumu : \(nightMissionType)")
        //mosnter resimleri
        let url = URL(string: "http://yunusgunduz.site/wildbite/image/missions/nightboss/\(nightMissionType).png")
        DispatchQueue.main.async{ [self] in
            missionMonsterImage.kf.setImage(with: url)
        }
        
        huntPow.text = "Monster Power: \(nightMissionType * 10 )"
      
        huntHealth.text = "Health : \(nightMissionType * 100 ) "
        
        // monster isimleri
        switch nightMissionType {
            case 1:  huntName.text = "Shadowbeast"
            case 3:  huntName.text = "Steelclaw"
            case 5:  huntName.text = "Venomgaze"
            case 7:  huntName.text = "Flamespirit"
            case 9:  huntName.text = "Stoneroar"
            case 10:  huntName.text = "Bloodsoil"
            case 11:  huntName.text = "Shadowreaper"
            case 13:  huntName.text = "Mindbreaker"
            case 15:  huntName.text = "Windmyst"
            case 17:  huntName.text = "Starcrusher"
            case 19:  huntName.text = "Fearlessgaze"
            case 20:  huntName.text = "Swordshatter"
            case 21:  huntName.text = "Flamejudgment"
            case 23:  huntName.text = "Venomclaw"
            case 25:  huntName.text = "Ironrend"
            case 27:  huntName.text = "Bloodhowl"
            case 29:  huntName.text = "Shadowbane"
            case 30:  huntName.text = "Echoessence"
            case 31:  huntName.text = "Spiritwanderer"
            case 33:  huntName.text = "Wingednightmare"
            case 35:  huntName.text = "Darkwall"
            case 37:  huntName.text = "Grandomenace"
            case 39:  huntName.text = "Venomscout"
            case 40:  huntName.text = "Stoneclaw"
            case 41:  huntName.text = "Skyblade"
            case 43:  huntName.text = "Bloodcleave"
            case 45:  huntName.text = "Moonshadow"
            case 47:  huntName.text = "Blackdeath"
            case 49:  huntName.text = "Ironrend"
            case 50:  huntName.text = "Thundergaze"
               
            default:  huntName.text = "monster name"
        }
  
        
        
    }

    
    
    
    
    
    
}
