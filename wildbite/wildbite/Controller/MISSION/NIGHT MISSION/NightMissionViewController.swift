//
//  NightMissionViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 10.04.2023.
//

import UIKit
import Alamofire

class NightMissionViewController: UIViewController {

    
    @IBOutlet weak var nmButton1: UIButton!
    @IBOutlet weak var nmButton2: UIButton!
    @IBOutlet weak var nmButton3: UIButton!
    @IBOutlet weak var nmButton4: UIButton!
    @IBOutlet weak var nmButton5: UIButton!
    @IBOutlet weak var nmButton6: UIButton!
    @IBOutlet weak var nmButton7: UIButton!
    @IBOutlet weak var nmButton8: UIButton!
    @IBOutlet weak var nmButton9: UIButton!
    @IBOutlet weak var nmButton10: UIButton!
    @IBOutlet weak var nmButton11: UIButton!
    @IBOutlet weak var nmButton12: UIButton!
    @IBOutlet weak var nmButton13: UIButton!
    @IBOutlet weak var nmButton14: UIButton!
    @IBOutlet weak var nmButton15: UIButton!
    @IBOutlet weak var nmButton16: UIButton!
    @IBOutlet weak var nmButton17: UIButton!
    @IBOutlet weak var nmButton18: UIButton!
    @IBOutlet weak var nmButton19: UIButton!
    @IBOutlet weak var nmButton20: UIButton!
    @IBOutlet weak var nmButton21: UIButton!
    @IBOutlet weak var nmButton22: UIButton!
    @IBOutlet weak var nmButton23: UIButton!
    @IBOutlet weak var nmButton24: UIButton!
    @IBOutlet weak var nmButton25: UIButton!
    @IBOutlet weak var nmButton26: UIButton!
    @IBOutlet weak var nmButton27: UIButton!
    @IBOutlet weak var nmButton28: UIButton!
    @IBOutlet weak var nmButton29: UIButton!
    @IBOutlet weak var nmButton30: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
      
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
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { [self] response in
                
                
                switch response.result {
                case .success:
                    print("Validation Successful")
                    
                    let profileModelresponse = try? JSONDecoder().decode(ProfileModel.self, from: response.data!)
                    debugPrint(profileModelresponse!)
                        
                        UserDefaults.standard.set(profileModelresponse!.user.name, forKey: "NightMissionUserName")
                        UserDefaults.standard.set(profileModelresponse!.user.totalDamage, forKey: "NightMissionUserTotalDamage")
                        UserDefaults.standard.set(profileModelresponse!.user.currentHealth, forKey: "NightMissionUserHealth")
                        UserDefaults.standard.set(profileModelresponse!.user.currentEnergy, forKey: "NightMissionUserEnergy")
                        UserDefaults.standard.set(profileModelresponse!.user.level, forKey: "NightMissionUserLevel")
                        
                        let missionYapilabilmedurumu = Int(profileModelresponse!.user.night_mission_state)  // apiden
                       let userLevel = Int(profileModelresponse!.user.level)
                       // let userLevel = Int("5")
                        dump("User userLevel : \(userLevel!)")
                        dump("User missionYapilabilmedurumu : \(missionYapilabilmedurumu!)")
                        if( userLevel! >= 1  && missionYapilabilmedurumu == 1) {nmButton1.isEnabled = true}
                        if( userLevel! >= 3  && missionYapilabilmedurumu == 2) {nmButton2.isEnabled = true}
                        if( userLevel! >= 5  && missionYapilabilmedurumu == 3) {nmButton3.isEnabled = true}
                        if( userLevel! >= 7  && missionYapilabilmedurumu == 4){nmButton4.isEnabled = true}
                        if( userLevel! >= 9  && missionYapilabilmedurumu == 5){nmButton5.isEnabled = true}
                        if( userLevel! >= 10  && missionYapilabilmedurumu == 6){nmButton6.isEnabled = true}
                        if( userLevel! >= 11  && missionYapilabilmedurumu == 7){nmButton7.isEnabled = true}
                        if( userLevel! >= 13  && missionYapilabilmedurumu == 8){nmButton8.isEnabled = true}
                        if( userLevel! >= 15  && missionYapilabilmedurumu == 9){nmButton9.isEnabled = true}
                        if( userLevel! >= 17  && missionYapilabilmedurumu == 10){nmButton10.isEnabled = true}
                        if( userLevel! >= 19  && missionYapilabilmedurumu == 11){nmButton11.isEnabled = true}
                        if( userLevel! >= 20  && missionYapilabilmedurumu == 12){nmButton12.isEnabled = true}
                        if( userLevel! >= 21  && missionYapilabilmedurumu == 13){nmButton13.isEnabled = true}
                        if( userLevel! >= 23  && missionYapilabilmedurumu == 14){nmButton14.isEnabled = true}
                        if( userLevel! >= 25  && missionYapilabilmedurumu == 15){nmButton15.isEnabled = true}
                        if( userLevel! >= 27  && missionYapilabilmedurumu == 16){nmButton16.isEnabled = true}
                        if( userLevel! >= 29  && missionYapilabilmedurumu == 17){nmButton17.isEnabled = true}
                        if( userLevel! >= 30  && missionYapilabilmedurumu == 18){nmButton18.isEnabled = true}
                        if( userLevel! >= 31  && missionYapilabilmedurumu == 19){nmButton19.isEnabled = true}
                        if( userLevel! >= 33  && missionYapilabilmedurumu == 20){nmButton20.isEnabled = true}
                        if( userLevel! >= 35  && missionYapilabilmedurumu == 21){nmButton21.isEnabled = true}
                        if( userLevel! >= 37  && missionYapilabilmedurumu == 22){nmButton22.isEnabled = true}
                        if( userLevel! >= 39  && missionYapilabilmedurumu == 23){nmButton23.isEnabled = true}
                        if( userLevel! >= 40  && missionYapilabilmedurumu == 24){nmButton24.isEnabled = true}
                        if( userLevel! >= 41  && missionYapilabilmedurumu == 25){nmButton25.isEnabled = true}
                        if( userLevel! >= 43  && missionYapilabilmedurumu == 26){nmButton26.isEnabled = true}
                        if( userLevel! >= 45  && missionYapilabilmedurumu == 27){nmButton27.isEnabled = true}
                        if( userLevel! >= 47  && missionYapilabilmedurumu == 28){nmButton28.isEnabled = true}
                        if( userLevel! >= 49  && missionYapilabilmedurumu == 29){nmButton29.isEnabled = true}
                        if( userLevel! >= 50  && missionYapilabilmedurumu == 30){nmButton30.isEnabled = true}
                           
                      
                        
                        
                    
                case let .failure(error):
                    print(error.errorDescription!)
                    print("hata")
                }
            }
    }
    
    
    
    
    
    @IBAction func btn1(_ sender: Any) {
        var value = 1
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn3(_ sender: Any) {
        var value = 2
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn5(_ sender: Any) {
        var value = 3
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn7(_ sender: Any) {
        var value = 4
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn9(_ sender: Any) {
        var value = 5
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn10(_ sender: Any) {
        var value = 6
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn11(_ sender: Any) {
        var value = 7
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn13(_ sender: Any) {
        var value = 8
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn15(_ sender: Any) {
        var value = 9
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn17(_ sender: Any) {
        var value = 10
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn19(_ sender: Any) {
        var value = 11
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn20(_ sender: Any) {
        var value = 12
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn21(_ sender: Any) {
        var value = 13
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn23(_ sender: Any) {
        var value = 14
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn25(_ sender: Any) {
        var value = 15
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn27(_ sender: Any) {
        var value = 16
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn29(_ sender: Any) {
        var value = 17
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn30(_ sender: Any) {
        var value = 18
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn31(_ sender: Any) {
        var value = 19
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn33(_ sender: Any) {
        var value = 20
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn35(_ sender: Any) {
        var value = 21
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn37(_ sender: Any) {
        var value = 22
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn39(_ sender: Any) {
        var value = 23
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn40(_ sender: Any) {
        var value = 24
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn41(_ sender: Any) {
        var value = 25
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn43(_ sender: Any) {
        var value = 26
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn45(_ sender: Any) {
        var value = 27
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn47(_ sender: Any) {
        var value = 28
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn49(_ sender: Any) {
        var value = 29
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btn50(_ sender: Any) {
        var value = 30
        UserDefaults.standard.set(value, forKey: "NightMissionType")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    
   
  

}
