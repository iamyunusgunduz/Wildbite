//
//  SettingsViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 5.04.2023.
//

import UIKit
import Alamofire

class ProfileSettViewController: UIViewController {

    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var userRaceLabel: UILabel!
    
    @IBOutlet weak var userLevelLabel: UILabel!
    
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBOutlet weak var userExpLabel: UILabel!
    
    @IBOutlet weak var userTotalDamageLabel: UILabel!
    
    @IBOutlet weak var userTotalWarLabel: UILabel!
    
    @IBOutlet weak var userTotalWarWinLabel: UILabel!
    
    @IBOutlet weak var userTotalWarLoseLabel: UILabel!
    
    @IBOutlet weak var userTotalWarGoldLabel: UILabel!
    
    @IBOutlet weak var userTotalHuntLabel: UILabel!
    
    @IBOutlet weak var userTotalSuccessHuntLabel: UILabel!
    
    @IBOutlet weak var userGoldLabel: UILabel!
    
    @IBOutlet weak var gucLabel: UILabel!
    
    @IBOutlet weak var defansLabel: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var gucProgressView: UIProgressView!
    
    @IBOutlet weak var defansProgressView: UIProgressView!
    
    @IBOutlet weak var hizProgressView: UIProgressView!
    
    @IBOutlet weak var AdminPanelButtonText: UIButton!
   // let myUserRole = UserDefaults.standard.value(forKey: "userRole")
  
    
    @IBOutlet weak var gucButtonLabel: UIButton!
    @IBOutlet weak var defButtonLabel: UIButton!
    @IBOutlet weak var speedButtonLabel: UIButton!
    
    var gucDegeri = 0
    var defDegeri  = 0
    var speedDegeri  = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gucProgressView.transform = gucProgressView.transform.scaledBy(x: 1, y: 5)
        defansProgressView.transform = defansProgressView.transform.scaledBy(x: 1, y: 5)
        hizProgressView.transform = hizProgressView.transform.scaledBy(x: 1, y: 5)
        
        
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
        
        DispatchQueue.main.async {
            AF.request("http://yunusgunduz.site/wildbite/public/api/user/\(myUserID!))" , headers: headers )
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .responseData { [self]  response in
                    
                    
                    switch response.result {
                    case .success:
                        print("Validation Successful")
                        
                        let profileModelresponse = try? JSONDecoder().decode(ProfileModel.self, from: response.data!)
                        debugPrint(profileModelresponse!)
                        
                        print(profileModelresponse!.user.name)
                        print("Race: \(profileModelresponse!.race.raceName)")
                        
                        
                        userNameLabel.text = "Username: \(profileModelresponse!.user.name)"
                        
                        userRaceLabel.text = "Race: \(profileModelresponse!.race.raceName)"
                        switch profileModelresponse!.race.raceName {
                        case "1":
                            userRaceLabel.text = "Race: Hunter"
                        case "2":
                            userRaceLabel.text = "Race: Werewolf"
                        case "3":
                            userRaceLabel.text = "Race: Vampire"
                        case "4":
                            userRaceLabel.text = "Race: Witch"
                        case "0":
                                userRaceLabel.text = "Race: Not Selected"
                        default:
                            userRaceLabel.text = "Race: None"
                        }
                        
                            var userExpOrani =  Int(profileModelresponse!.user.exp)
                            switch userExpOrani!{  //MARK: - kafama göre  level orani belirledim
                                case 1...10:
                                    userLevelLabel.text = "Level: 1"
                                    userExpLabel.text = "Experience: \(profileModelresponse!.user.exp) / 10"
                                case 11...30:
                                    userLevelLabel.text = "Level: 2"
                                    userExpLabel.text = "Experience: \(profileModelresponse!.user.exp)/ 30"
                                case 31...60:
                                    userLevelLabel.text = "Level: 3"
                                    userExpLabel.text = "Experience: \(profileModelresponse!.user.exp)/ 60"
                                case 61...100:
                                    userLevelLabel.text = "Level: 4"
                                    userExpLabel.text = "Experience: \(profileModelresponse!.user.exp)/ 100"
                                case 101...200:
                                    userLevelLabel.text = "Level: 5"
                                    userExpLabel.text = "Experience: \(profileModelresponse!.user.exp)/ 200"
                                case 201...450:
                                    userLevelLabel.text = "Level: 6"
                                    userExpLabel.text = "Experience: \(profileModelresponse!.user.exp)/ 450"
                                case 451...750:
                                    userLevelLabel.text = "Level: 7"
                                    userExpLabel.text = "Experience: \(profileModelresponse!.user.exp)/ 750"
                                case 751...1000:
                                    userLevelLabel.text = "Level: 8"
                                    userExpLabel.text = "Experience: \(profileModelresponse!.user.exp)/ 1000"
                                default:
                                    userLevelLabel.text = "Level: None"
                                    userExpLabel.text = "Experience: none"
                            }
                       
                        userEmailLabel.text = "Email: \(profileModelresponse!.user.email)"
                        userGoldLabel.text = "Gold: \(profileModelresponse!.user.gold)"
                      
                        userTotalDamageLabel.text = "Damage: \(profileModelresponse!.user.totalDamage)"
                        
                        let warTotals = profileModelresponse!.user.warTotal
                        let warWin = Double (profileModelresponse!.user.warTotalWin)
                        let warLose = Double (profileModelresponse!.user.warTotalLose)
                        
                            if(Int(profileModelresponse!.user.gold)! < 10){gucButtonLabel.isEnabled = false} else {gucButtonLabel.isEnabled = true}
                            if(Int(profileModelresponse!.user.gold)! < 5 ){defButtonLabel.isEnabled = false} else {defButtonLabel.isEnabled = true}
                            if(Int(profileModelresponse!.user.gold)! < 2 ){speedButtonLabel.isEnabled = false} else {speedButtonLabel.isEnabled = true}
                       
                      
                        if(warLose! != 0){
                            let kda:Double = (warWin ?? 1) / (warLose ?? 1)
                            debugPrint("\(warTotals)  \(warWin!)  \(warLose!) \(kda) (WWR)")
                            userTotalWarLabel.text = "WAR WIN RATE: \(kda) in (\(warTotals)) war "
                        }else{
                            userTotalWarLabel.text = "WAR WIN RATE: \(warWin!) (WWR)"
                        }
                        
                        
                        
                        userTotalWarWinLabel.text = "Total War Win: \(profileModelresponse!.user.warTotalWin)"
                        userTotalWarLoseLabel.text = "Total War Lose: \(profileModelresponse!.user.warTotalLose)"
                        userTotalWarGoldLabel.text = "Total War Gold: \(profileModelresponse!.user.warTotalGold)"
                        userTotalHuntLabel.text = "Total Hunt: \(profileModelresponse!.user.totalHunt)"
                        userTotalSuccessHuntLabel.text = "Total Hunt Win: \(profileModelresponse!.user.totalSuccessHunt)"
                        
                        let gucValue = Float(profileModelresponse!.user.power)!
                        let defValue = Float(profileModelresponse!.user.defense)!
                        let hizValue = Float(profileModelresponse!.user.speed)!
                            gucDegeri = Int(gucValue)
                            defDegeri = Int(defValue)
                            speedDegeri = Int(hizValue)
                            
                            
                            dump(profileModelresponse!.user.power)
                            
                        gucLabel.text = "\(Int(gucValue))"
                        defansLabel.text = "\(Int(defValue))"
                        speedLabel.text = "\(Int(hizValue))"
                        
                           
                        if(gucValue > 99.0 || defValue > 99.0 || hizValue > 99.0){
                            gucProgressView.progress = (gucValue )/1000
                             
                            defansProgressView.progress = (defValue )/1000
                             
                            hizProgressView.progress = (hizValue )/1000
                        } else {
                            gucProgressView.progress = (gucValue )/10
                             
                            defansProgressView.progress = (defValue )/10
                             
                            hizProgressView.progress = (hizValue )/10
                        }
                     let myUserRole = profileModelresponse!.user.role
                        print("Debug: user role\(myUserRole)")
                        if(myUserRole   == "4"){
                            AdminPanelButtonText.isHidden = false
                        }else{
                            AdminPanelButtonText.isHidden = true
                        }
                        
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
    }

    @IBAction func GucArttirButton(_ sender: Any) {
    
        
        userStateArttir(pow: 1, def: 0, spd: 0, totlDamge: 3, gld: -10)
    
    }
    @IBAction func DefArttirButton(_ sender: Any) {
        userStateArttir(pow: 0, def: 1, spd: 0, totlDamge: 2, gld: -5)
    }
    @IBAction func HizArttirButton(_ sender: Any) {
        userStateArttir(pow: 0, def: 0, spd: 1, totlDamge: 1, gld: -2)
    }
    @IBAction func AdminPanelButton(_ sender: Any) {
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
