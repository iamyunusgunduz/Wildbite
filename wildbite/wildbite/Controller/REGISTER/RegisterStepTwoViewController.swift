//
//  RegisterStepTwoViewController.swift
//  wildbite
//
//  Created by Yunus Gündüz on 7.06.2023.
//

import UIKit
import Alamofire
import SwiftyGif
class RegisterStepTwoViewController: UIViewController {

    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var characterName: UILabel!
    
    @IBOutlet weak var beforeButtonLabel: UIButton!
    
    @IBOutlet weak var afterButtonLabel: UIButton!
  var userimage:String = "https://yunusgunduz.site/wildbite/image/user/0.gif";
    var userimageValue:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background.png")!)
        
        
      
         
        
    }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async { [self] in
           profileImage.setGifFromURL(URL(string: "\(userimage)")!)
        }
    }

    @IBAction func afterButton(_ sender: Any) {
        
      
        if(userimageValue >= 0 && userimageValue < 7 ){
            userimageValue += 1 ;
            userimage = "https://yunusgunduz.site/wildbite/image/user/\(userimageValue).gif"
            DispatchQueue.main.async { [self] in
                self.profileImage.setGifFromURL(URL(string: "\(userimage)")!)
            }
            
            dump(   userimage )
        }
    
    }
    
    @IBAction func beforeButton(_ sender: Any) {
        if(userimageValue > 0 && userimageValue <= 7 ){
            userimageValue -= 1 ;
            userimage = "https://yunusgunduz.site/wildbite/image/user/\(userimageValue).gif"
            DispatchQueue.main.async { [self] in
                self.profileImage.setGifFromURL(URL(string: "\(userimage)")!)
            }
            dump(   userimage )
        }
        
      
    }
    
    @IBAction func characterSelectButton(_ sender: Any) {
        dump(   userimage )
      /*
       var userrole = 1
        var userlevel = 1
        var userexp = 0
        var userwartotal = 0
        var userwarwin = 0
        var userwarlose = 0
        var userwargold = 0
        var usergold = 100
        var userdiamond = 0
        var usertotalhunt  = 0
        var usersuccesshunt  = 0
        var usercurrenthealth  = 100
        var usermaxhealth  = 100
        var usercurrentenergy  = 10
        var usermaxenergy  = 10
        var userregenerate_health_range = 1
        var totaldamage = 10
        
        var userrace = 1
        var userpower = 2
        var userdefense = 5
        var userspeed  = 3
        
        var usernameUSS = UserDefaults.standard.string(forKey: "RegisterUserName")
        var usertokenUSS = UserDefaults.standard.string(forKey: "RegisterUserToken")
        var useridUSS = UserDefaults.standard.integer(forKey: "RegisterUserID")
        var useremailUSS = UserDefaults.standard.string(forKey: "RegisterUserEmail")
        var userpasswordUSS = UserDefaults.standard.string(forKey: "RegisterPassword")
        
        
        let headers: HTTPHeaders = [
        
            .authorization(bearerToken: usertokenUSS!),
            .accept("application/json")
            
        ]
        let registerraceparameters =  RegisterRace(name: usernameUSS!, email: useremailUSS!, password: userpasswordUSS!, role: userrole, race: userrace, level: userlevel, night_mission_state:"1", exp: userexp, war_total: userwartotal, war_total_win: userwarwin, war_total_lose: userwarlose, war_total_gold: userwargold, gold: usergold, diamond: userdiamond, total_damage: totaldamage, power: userpower, defense: userdefense, speed: userspeed, total_hunt: usertotalhunt, total_success_hunt: usersuccesshunt, current_health: usercurrenthealth, maximum_health: usermaxhealth, regenerate_health_range: userregenerate_health_range, current_energy: usercurrentenergy, maximum_energy: usermaxenergy, image: RegisterStepTwoViewController.userimage)
          
           AF.request("http://yunusgunduz.site/wildbite/public/api/user/\(useridUSS)",
                      method: .put,
                      parameters: registerraceparameters,
                      headers: headers)
           .validate(statusCode: 200..<500)
           .validate(contentType: ["application/json"])
           .responseData { [self] response in
               debugPrint(response)
                
               switch response.result {
               case .success:
                   print("Register Successful")
                   
                       let registerRaceresponse = try? JSONDecoder().decode(RegisterRaceModel.self,  from: response.data!)
                       self.performSegue(withIdentifier: "registerRaceToLogin", sender: nil)
                   debugPrint(registerRaceresponse ?? "ne oldi")
                   if(registerRaceresponse?.the1 == nil){
                       print("Debug: Message:  \(registerRaceresponse?.the1 ?? "bisey oldu")")
                       return
                   }

                       if(registerRaceresponse!.the1 == "User updated"){
                       self.performSegue(withIdentifier: "registerRaceToLogin", sender: nil)

                   }else{
                       print("DEBUG: Kayit olunamadi mesaji döndü")
                   }

               case let .failure(error):
                   print(error.errorDescription!)
                   print("hata")
               }
           }
        
        */
    }
    
}
