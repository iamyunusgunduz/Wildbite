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
    
    
    @IBOutlet weak var gucLabel: UILabel!
    
    
    @IBOutlet weak var defansLabel: UILabel!
    
    
    @IBOutlet weak var speedLabel: UILabel!
    
    
    @IBOutlet weak var gucProgressView: UIProgressView!
    
    
    @IBOutlet weak var defansProgressView: UIProgressView!
    
    
    @IBOutlet weak var hizProgressView: UIProgressView!
    
    
    @IBOutlet weak var AdminPanelButtonText: UIButton!
    let myUserRole = UserDefaults.standard.value(forKey: "userRole")
    override func viewDidLoad() {
        super.viewDidLoad()
        gucProgressView.transform = gucProgressView.transform.scaledBy(x: 1, y: 5)
        defansProgressView.transform = defansProgressView.transform.scaledBy(x: 1, y: 5)
        hizProgressView.transform = hizProgressView.transform.scaledBy(x: 1, y: 5)
        
        if(myUserRole as! String == "0"){
            AdminPanelButtonText.isHidden = false
        }
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
                        userLevelLabel.text = "Level: \(profileModelresponse!.user.level)"
                        userEmailLabel.text = "Email: \(profileModelresponse!.user.email)"
                        userExpLabel.text = "Experience: \(profileModelresponse!.user.exp)"
                        userTotalDamageLabel.text = "Damage: \(profileModelresponse!.user.totalDamage)"
                        userTotalWarLabel.text = "Total War: \(profileModelresponse!.user.warTotal)"
                        userTotalWarWinLabel.text = "Total War Win: \(profileModelresponse!.user.warTotalWin)"
                        userTotalWarLoseLabel.text = "Total War Lose: \(profileModelresponse!.user.warTotalLose)"
                        userTotalWarGoldLabel.text = "Total War Gold: \(profileModelresponse!.user.warTotalGold)"
                        userTotalHuntLabel.text = "Total Hunt: \(profileModelresponse!.user.totalHunt)"
                        userTotalSuccessHuntLabel.text = "Total Hunt Win: \(profileModelresponse!.user.totalSuccessHunt)"
                        
                        let gucValue = Float(profileModelresponse!.user.power)!
                        let defValue = Float(profileModelresponse!.user.defense)!
                        let hizValue = Float(profileModelresponse!.user.speed)!
                        
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
                        
                        
                       
                        
                        profileModelresponse!.item.forEach { Item in
                            print("Item Name: \(Item.itemName) Level")
                            print(Item.itemName)
                            
                            
                            
                            
                            
                            
                            
                        }
                        
                        
                        
                    case let .failure(error):
                        print(error.errorDescription!)
                        print("hata")
                    }
                }
        }
    }

   
    @IBAction func AdminPanelButton(_ sender: Any) {
    }
    
}
