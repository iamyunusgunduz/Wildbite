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
        
     
      
        AF.request("http://backhub.site/wildbite/public/api/user/\(myUserID!))" , headers: headers )
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
                        let gorevMesaji = "Tamamlandı"
                        switch missionYapilabilmedurumu {
                            case 30: //MARK: - 30 olma durumu
                                
                                nmButton1.setTitle(gorevMesaji, for: .normal)
                                nmButton2.setTitle(gorevMesaji, for: .normal)
                                nmButton3.setTitle(gorevMesaji, for: .normal)
                                nmButton4.setTitle(gorevMesaji, for: .normal)
                                nmButton5.setTitle(gorevMesaji, for: .normal)
                                nmButton6.setTitle(gorevMesaji, for: .normal)
                                nmButton7.setTitle(gorevMesaji, for: .normal)
                                nmButton8.setTitle(gorevMesaji, for: .normal)
                                nmButton9.setTitle(gorevMesaji, for: .normal)
                                nmButton10.setTitle(gorevMesaji, for: .normal)
                                nmButton11.setTitle(gorevMesaji, for: .normal)
                                nmButton12.setTitle(gorevMesaji, for: .normal)
                                nmButton13.setTitle(gorevMesaji, for: .normal)
                                nmButton14.setTitle(gorevMesaji, for: .normal)
                                nmButton15.setTitle(gorevMesaji, for: .normal)
                                nmButton16.setTitle(gorevMesaji, for: .normal)
                                nmButton17.setTitle(gorevMesaji, for: .normal)
                                nmButton18.setTitle(gorevMesaji, for: .normal)
                                nmButton19.setTitle(gorevMesaji, for: .normal)
                                nmButton20.setTitle(gorevMesaji, for: .normal)
                                nmButton21.setTitle(gorevMesaji, for: .normal)
                                nmButton22.setTitle(gorevMesaji, for: .normal)
                                nmButton23.setTitle(gorevMesaji, for: .normal)
                                nmButton24.setTitle(gorevMesaji, for: .normal)
                                nmButton25.setTitle(gorevMesaji, for: .normal)
                                nmButton26.setTitle(gorevMesaji, for: .normal)
                                nmButton27.setTitle(gorevMesaji, for: .normal)
                                nmButton28.setTitle(gorevMesaji, for: .normal)
                                nmButton29.setTitle(gorevMesaji, for: .normal)
                             
                            case 29: //MARK: - 29 olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                                    nmButton12.setTitle(gorevMesaji, for: .normal)
                                    nmButton13.setTitle(gorevMesaji, for: .normal)
                                    nmButton14.setTitle(gorevMesaji, for: .normal)
                                    nmButton15.setTitle(gorevMesaji, for: .normal)
                                    nmButton16.setTitle(gorevMesaji, for: .normal)
                                    nmButton17.setTitle(gorevMesaji, for: .normal)
                                    nmButton18.setTitle(gorevMesaji, for: .normal)
                                    nmButton19.setTitle(gorevMesaji, for: .normal)
                                    nmButton20.setTitle(gorevMesaji, for: .normal)
                                    nmButton21.setTitle(gorevMesaji, for: .normal)
                                    nmButton22.setTitle(gorevMesaji, for: .normal)
                                    nmButton23.setTitle(gorevMesaji, for: .normal)
                                    nmButton24.setTitle(gorevMesaji, for: .normal)
                                    nmButton25.setTitle(gorevMesaji, for: .normal)
                                    nmButton26.setTitle(gorevMesaji, for: .normal)
                                    nmButton27.setTitle(gorevMesaji, for: .normal)
                                    nmButton28.setTitle(gorevMesaji, for: .normal)
                                 
                            case 28: //MARK: - 28 olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                                    nmButton12.setTitle(gorevMesaji, for: .normal)
                                    nmButton13.setTitle(gorevMesaji, for: .normal)
                                    nmButton14.setTitle(gorevMesaji, for: .normal)
                                    nmButton15.setTitle(gorevMesaji, for: .normal)
                                    nmButton16.setTitle(gorevMesaji, for: .normal)
                                    nmButton17.setTitle(gorevMesaji, for: .normal)
                                    nmButton18.setTitle(gorevMesaji, for: .normal)
                                    nmButton19.setTitle(gorevMesaji, for: .normal)
                                    nmButton20.setTitle(gorevMesaji, for: .normal)
                                    nmButton21.setTitle(gorevMesaji, for: .normal)
                                    nmButton22.setTitle(gorevMesaji, for: .normal)
                                    nmButton23.setTitle(gorevMesaji, for: .normal)
                                    nmButton24.setTitle(gorevMesaji, for: .normal)
                                    nmButton25.setTitle(gorevMesaji, for: .normal)
                                    nmButton26.setTitle(gorevMesaji, for: .normal)
                                    nmButton27.setTitle(gorevMesaji, for: .normal)
                             
                            case 27: //MARK: - 27 olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                                    nmButton12.setTitle(gorevMesaji, for: .normal)
                                    nmButton13.setTitle(gorevMesaji, for: .normal)
                                    nmButton14.setTitle(gorevMesaji, for: .normal)
                                    nmButton15.setTitle(gorevMesaji, for: .normal)
                                    nmButton16.setTitle(gorevMesaji, for: .normal)
                                    nmButton17.setTitle(gorevMesaji, for: .normal)
                                    nmButton18.setTitle(gorevMesaji, for: .normal)
                                    nmButton19.setTitle(gorevMesaji, for: .normal)
                                    nmButton20.setTitle(gorevMesaji, for: .normal)
                                    nmButton21.setTitle(gorevMesaji, for: .normal)
                                    nmButton22.setTitle(gorevMesaji, for: .normal)
                                    nmButton23.setTitle(gorevMesaji, for: .normal)
                                    nmButton24.setTitle(gorevMesaji, for: .normal)
                                    nmButton25.setTitle(gorevMesaji, for: .normal)
                                    nmButton26.setTitle(gorevMesaji, for: .normal)
                                    
                            case 26: //MARK: - 26 olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                                    nmButton12.setTitle(gorevMesaji, for: .normal)
                                    nmButton13.setTitle(gorevMesaji, for: .normal)
                                    nmButton14.setTitle(gorevMesaji, for: .normal)
                                    nmButton15.setTitle(gorevMesaji, for: .normal)
                                    nmButton16.setTitle(gorevMesaji, for: .normal)
                                    nmButton17.setTitle(gorevMesaji, for: .normal)
                                    nmButton18.setTitle(gorevMesaji, for: .normal)
                                    nmButton19.setTitle(gorevMesaji, for: .normal)
                                    nmButton20.setTitle(gorevMesaji, for: .normal)
                                    nmButton21.setTitle(gorevMesaji, for: .normal)
                                    nmButton22.setTitle(gorevMesaji, for: .normal)
                                    nmButton23.setTitle(gorevMesaji, for: .normal)
                                    nmButton24.setTitle(gorevMesaji, for: .normal)
                                    nmButton25.setTitle(gorevMesaji, for: .normal)
                            case 25: //MARK: - 25 olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                                    nmButton12.setTitle(gorevMesaji, for: .normal)
                                    nmButton13.setTitle(gorevMesaji, for: .normal)
                                    nmButton14.setTitle(gorevMesaji, for: .normal)
                                    nmButton15.setTitle(gorevMesaji, for: .normal)
                                    nmButton16.setTitle(gorevMesaji, for: .normal)
                                    nmButton17.setTitle(gorevMesaji, for: .normal)
                                    nmButton18.setTitle(gorevMesaji, for: .normal)
                                    nmButton19.setTitle(gorevMesaji, for: .normal)
                                    nmButton20.setTitle(gorevMesaji, for: .normal)
                                    nmButton21.setTitle(gorevMesaji, for: .normal)
                                    nmButton22.setTitle(gorevMesaji, for: .normal)
                                    nmButton23.setTitle(gorevMesaji, for: .normal)
                                    nmButton24.setTitle(gorevMesaji, for: .normal)
                            case 24: //MARK: - 24 olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                                    nmButton12.setTitle(gorevMesaji, for: .normal)
                                    nmButton13.setTitle(gorevMesaji, for: .normal)
                                    nmButton14.setTitle(gorevMesaji, for: .normal)
                                    nmButton15.setTitle(gorevMesaji, for: .normal)
                                    nmButton16.setTitle(gorevMesaji, for: .normal)
                                    nmButton17.setTitle(gorevMesaji, for: .normal)
                                    nmButton18.setTitle(gorevMesaji, for: .normal)
                                    nmButton19.setTitle(gorevMesaji, for: .normal)
                                    nmButton20.setTitle(gorevMesaji, for: .normal)
                                    nmButton21.setTitle(gorevMesaji, for: .normal)
                                    nmButton22.setTitle(gorevMesaji, for: .normal)
                                    nmButton23.setTitle(gorevMesaji, for: .normal)
                            case 23: //MARK: - 23olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                                    nmButton12.setTitle(gorevMesaji, for: .normal)
                                    nmButton13.setTitle(gorevMesaji, for: .normal)
                                    nmButton14.setTitle(gorevMesaji, for: .normal)
                                    nmButton15.setTitle(gorevMesaji, for: .normal)
                                    nmButton16.setTitle(gorevMesaji, for: .normal)
                                    nmButton17.setTitle(gorevMesaji, for: .normal)
                                    nmButton18.setTitle(gorevMesaji, for: .normal)
                                    nmButton19.setTitle(gorevMesaji, for: .normal)
                                    nmButton20.setTitle(gorevMesaji, for: .normal)
                                    nmButton21.setTitle(gorevMesaji, for: .normal)
                                    nmButton22.setTitle(gorevMesaji, for: .normal)
                            case 22: //MARK: - 22olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                                    nmButton12.setTitle(gorevMesaji, for: .normal)
                                    nmButton13.setTitle(gorevMesaji, for: .normal)
                                    nmButton14.setTitle(gorevMesaji, for: .normal)
                                    nmButton15.setTitle(gorevMesaji, for: .normal)
                                    nmButton16.setTitle(gorevMesaji, for: .normal)
                                    nmButton17.setTitle(gorevMesaji, for: .normal)
                                    nmButton18.setTitle(gorevMesaji, for: .normal)
                                    nmButton19.setTitle(gorevMesaji, for: .normal)
                                    nmButton20.setTitle(gorevMesaji, for: .normal)
                                    nmButton21.setTitle(gorevMesaji, for: .normal)
                            case 21: //MARK: - 21olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                                    nmButton12.setTitle(gorevMesaji, for: .normal)
                                    nmButton13.setTitle(gorevMesaji, for: .normal)
                                    nmButton14.setTitle(gorevMesaji, for: .normal)
                                    nmButton15.setTitle(gorevMesaji, for: .normal)
                                    nmButton16.setTitle(gorevMesaji, for: .normal)
                                    nmButton17.setTitle(gorevMesaji, for: .normal)
                                    nmButton18.setTitle(gorevMesaji, for: .normal)
                                    nmButton19.setTitle(gorevMesaji, for: .normal)
                                    nmButton20.setTitle(gorevMesaji, for: .normal)
                            case 20: //MARK: - 20olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                                    nmButton12.setTitle(gorevMesaji, for: .normal)
                                    nmButton13.setTitle(gorevMesaji, for: .normal)
                                    nmButton14.setTitle(gorevMesaji, for: .normal)
                                    nmButton15.setTitle(gorevMesaji, for: .normal)
                                    nmButton16.setTitle(gorevMesaji, for: .normal)
                                    nmButton17.setTitle(gorevMesaji, for: .normal)
                                    nmButton18.setTitle(gorevMesaji, for: .normal)
                                    nmButton19.setTitle(gorevMesaji, for: .normal)
                            case 19: //MARK: - 19olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                                    nmButton12.setTitle(gorevMesaji, for: .normal)
                                    nmButton13.setTitle(gorevMesaji, for: .normal)
                                    nmButton14.setTitle(gorevMesaji, for: .normal)
                                    nmButton15.setTitle(gorevMesaji, for: .normal)
                                    nmButton16.setTitle(gorevMesaji, for: .normal)
                                    nmButton17.setTitle(gorevMesaji, for: .normal)
                                    nmButton18.setTitle(gorevMesaji, for: .normal)
                            case 18: //MARK: - 18olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                                    nmButton12.setTitle(gorevMesaji, for: .normal)
                                    nmButton13.setTitle(gorevMesaji, for: .normal)
                                    nmButton14.setTitle(gorevMesaji, for: .normal)
                                    nmButton15.setTitle(gorevMesaji, for: .normal)
                                    nmButton16.setTitle(gorevMesaji, for: .normal)
                                    nmButton17.setTitle(gorevMesaji, for: .normal)
                            case 17: //MARK: - 17olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                                    nmButton12.setTitle(gorevMesaji, for: .normal)
                                    nmButton13.setTitle(gorevMesaji, for: .normal)
                                    nmButton14.setTitle(gorevMesaji, for: .normal)
                                    nmButton15.setTitle(gorevMesaji, for: .normal)
                                    nmButton16.setTitle(gorevMesaji, for: .normal)
                            case 16: //MARK: - 16olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                                    nmButton12.setTitle(gorevMesaji, for: .normal)
                                    nmButton13.setTitle(gorevMesaji, for: .normal)
                                    nmButton14.setTitle(gorevMesaji, for: .normal)
                                    nmButton15.setTitle(gorevMesaji, for: .normal)
                            case 15: //MARK: - 15olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                                    nmButton12.setTitle(gorevMesaji, for: .normal)
                                    nmButton13.setTitle(gorevMesaji, for: .normal)
                                    nmButton14.setTitle(gorevMesaji, for: .normal)
                            case 14: //MARK: - 14olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                                    nmButton12.setTitle(gorevMesaji, for: .normal)
                                    nmButton13.setTitle(gorevMesaji, for: .normal)
                            case 13: //MARK: - 13olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                                    nmButton12.setTitle(gorevMesaji, for: .normal)
                            case 12: //MARK: - 12olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                                    nmButton11.setTitle(gorevMesaji, for: .normal)
                            case 11: //MARK: - 11olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                                    nmButton10.setTitle(gorevMesaji, for: .normal)
                            case 10: //MARK: - 10olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                                    nmButton9.setTitle(gorevMesaji, for: .normal)
                            case 9: //MARK: - 9olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                                    nmButton8.setTitle(gorevMesaji, for: .normal)
                            case 8: //MARK: - 8olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                                    nmButton7.setTitle(gorevMesaji, for: .normal)
                            case 7: //MARK: - 7olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                                    nmButton6.setTitle(gorevMesaji, for: .normal)
                            case 6: //MARK: - 6olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                                    nmButton5.setTitle(gorevMesaji, for: .normal)
                            case 5: //MARK: - 5olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                                    nmButton4.setTitle(gorevMesaji, for: .normal)
                            case 4: //MARK: - 4olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                                    nmButton3.setTitle(gorevMesaji, for: .normal)
                            case 3: //MARK: - 3olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                                    nmButton2.setTitle(gorevMesaji, for: .normal)
                            case 2: //MARK: - 2olma durumu
                                    nmButton1.setTitle(gorevMesaji, for: .normal)
                            
                                     
                                   
                            default:
                                break;
                        }
                        if( userLevel! >= 1  && missionYapilabilmedurumu == 1)  {nmButton1.isEnabled = true
                            nmButton1.setTitle("Shadowbeast| level : 1", for: .normal)
                            nmButton1.contentVerticalAlignment = .center
                            nmButton1.contentHorizontalAlignment = .center
                            nmButton1.setTitleColor(UIColor.black, for: .normal)
                            nmButton1.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 3  && missionYapilabilmedurumu == 2)  {nmButton2.isEnabled = true
                            nmButton2.setTitle("Steelclaw| level : 3", for: .normal)
                            nmButton2.contentVerticalAlignment = .center
                            nmButton2.contentHorizontalAlignment = .center
                            nmButton2.setTitleColor(UIColor.black, for: .normal)
                            nmButton2.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 5  && missionYapilabilmedurumu == 3)  {nmButton3.isEnabled = true
                            nmButton3.setTitle("Venomgaze| level : 5", for: .normal)
                            nmButton3.contentVerticalAlignment = .center
                            nmButton3.contentHorizontalAlignment = .center
                            nmButton3.setTitleColor(UIColor.black, for: .normal)
                            nmButton3.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 7  && missionYapilabilmedurumu == 4)  {nmButton4.isEnabled = true
                            nmButton4.setTitle("Flamespirit| level : 7", for: .normal)
                            nmButton4.contentVerticalAlignment = .center
                            nmButton4.contentHorizontalAlignment = .center
                            nmButton4.setTitleColor(UIColor.black, for: .normal)
                            nmButton4.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 9  && missionYapilabilmedurumu == 5)  {nmButton5.isEnabled = true
                            nmButton5.setTitle("Stoneroar| level : 9", for: .normal)
                            nmButton5.contentVerticalAlignment = .center
                            nmButton5.contentHorizontalAlignment = .center
                            nmButton5.setTitleColor(UIColor.black, for: .normal)
                            nmButton5.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 10  && missionYapilabilmedurumu == 6) {nmButton6.isEnabled = true
                            nmButton6.setTitle("Bloodsoil| level : 10", for: .normal)
                            nmButton6.contentVerticalAlignment = .center
                            nmButton6.contentHorizontalAlignment = .center
                            nmButton6.setTitleColor(UIColor.black, for: .normal)
                            nmButton6.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 11  && missionYapilabilmedurumu == 7) {nmButton7.isEnabled = true
                            nmButton7.setTitle("Shadowreaper| level : 11", for: .normal)
                            nmButton7.contentVerticalAlignment = .center
                            nmButton7.contentHorizontalAlignment = .center
                            nmButton7.setTitleColor(UIColor.black, for: .normal)
                            nmButton7.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 13  && missionYapilabilmedurumu == 8) {nmButton8.isEnabled = true
                            nmButton8.setTitle("Mindbreaker| level : 13", for: .normal)
                            nmButton8.contentVerticalAlignment = .center
                            nmButton8.contentHorizontalAlignment = .center
                            nmButton8.setTitleColor(UIColor.black, for: .normal)
                            nmButton8.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 15  && missionYapilabilmedurumu == 9) {nmButton9.isEnabled = true
                            nmButton9.setTitle("Windmyst| level : 15", for: .normal)
                            nmButton9.contentVerticalAlignment = .center
                            nmButton9.contentHorizontalAlignment = .center
                            nmButton9.setTitleColor(UIColor.black, for: .normal)
                            nmButton9.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 17  && missionYapilabilmedurumu == 10){nmButton10.isEnabled = true
                            nmButton10.setTitle("Starcrusher| level : 17", for: .normal)
                            nmButton10.contentVerticalAlignment = .center
                            nmButton10.contentHorizontalAlignment = .center
                            nmButton10.setTitleColor(UIColor.black, for: .normal)
                            nmButton10.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 19  && missionYapilabilmedurumu == 11){nmButton11.isEnabled = true
                            nmButton11.setTitle("Fearlessgaze| level : 19", for: .normal)
                            nmButton11.contentVerticalAlignment = .center
                            nmButton11.contentHorizontalAlignment = .center
                            nmButton11.setTitleColor(UIColor.black, for: .normal)
                            nmButton11.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 20  && missionYapilabilmedurumu == 12){nmButton12.isEnabled = true
                            nmButton12.setTitle("Swordshatter| level : 20", for: .normal)
                            nmButton12.contentVerticalAlignment = .center
                            nmButton12.contentHorizontalAlignment = .center
                            nmButton12.setTitleColor(UIColor.black, for: .normal)
                            nmButton12.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 21  && missionYapilabilmedurumu == 13){nmButton13.isEnabled = true
                            nmButton13.setTitle("Flamejudgment| level : 21", for: .normal)
                            nmButton13.contentVerticalAlignment = .center
                            nmButton13.contentHorizontalAlignment = .center
                            nmButton13.setTitleColor(UIColor.black, for: .normal)
                            nmButton13.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 23  && missionYapilabilmedurumu == 14){nmButton14.isEnabled = true
                            nmButton14.setTitle("Venomclaw| level : 23", for: .normal)
                            nmButton14.contentVerticalAlignment = .center
                            nmButton14.contentHorizontalAlignment = .center
                            nmButton14.setTitleColor(UIColor.black, for: .normal)
                            nmButton14.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 25  && missionYapilabilmedurumu == 15){nmButton15.isEnabled = true
                            nmButton15.setTitle("Ironrend| level : 25", for: .normal)
                            nmButton15.contentVerticalAlignment = .center
                            nmButton15.contentHorizontalAlignment = .center
                            nmButton15.setTitleColor(UIColor.black, for: .normal)
                            nmButton15.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 27  && missionYapilabilmedurumu == 16){nmButton16.isEnabled = true
                            nmButton16.setTitle("Bloodhowl| level : 27", for: .normal)
                            nmButton16.contentVerticalAlignment = .center
                            nmButton16.contentHorizontalAlignment = .center
                            nmButton16.setTitleColor(UIColor.black, for: .normal)
                            nmButton16.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 29  && missionYapilabilmedurumu == 17){nmButton17.isEnabled = true
                            nmButton17.setTitle("Shadowbane| level : 29", for: .normal)
                            nmButton17.contentVerticalAlignment = .center
                            nmButton17.contentHorizontalAlignment = .center
                            nmButton17.setTitleColor(UIColor.black, for: .normal)
                            nmButton17.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 30  && missionYapilabilmedurumu == 18){nmButton18.isEnabled = true
                            nmButton18.setTitle("Echoessence| level : 30", for: .normal)
                            nmButton18.contentVerticalAlignment = .center
                            nmButton18.contentHorizontalAlignment = .center
                            nmButton18.setTitleColor(UIColor.black, for: .normal)
                            nmButton18.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 31  && missionYapilabilmedurumu == 19){nmButton19.isEnabled = true
                            nmButton19.setTitle("Spiritwanderer| level : 31", for: .normal)
                            nmButton19.contentVerticalAlignment = .center
                            nmButton19.contentHorizontalAlignment = .center
                            nmButton19.setTitleColor(UIColor.black, for: .normal)
                            nmButton19.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 33  && missionYapilabilmedurumu == 20){nmButton20.isEnabled = true
                            nmButton20.setTitle("Wingednightmare| level : 33", for: .normal)
                            nmButton20.contentVerticalAlignment = .center
                            nmButton20.contentHorizontalAlignment = .center
                            nmButton20.setTitleColor(UIColor.black, for: .normal)
                            nmButton20.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 35  && missionYapilabilmedurumu == 21){nmButton21.isEnabled = true
                            nmButton21.setTitle("Darkwall| level : 35", for: .normal)
                            nmButton21.contentVerticalAlignment = .center
                            nmButton21.contentHorizontalAlignment = .center
                            nmButton21.setTitleColor(UIColor.black, for: .normal)
                            nmButton21.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 37  && missionYapilabilmedurumu == 22){nmButton22.isEnabled = true
                            nmButton22.setTitle("Grandomenace| level : 37", for: .normal)
                            nmButton22.contentVerticalAlignment = .center
                            nmButton22.contentHorizontalAlignment = .center
                            nmButton22.setTitleColor(UIColor.black, for: .normal)
                            nmButton22.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 39  && missionYapilabilmedurumu == 23){nmButton23.isEnabled = true
                            nmButton23.setTitle("Venomscout| level : 39", for: .normal)
                            nmButton23.contentVerticalAlignment = .center
                            nmButton23.contentHorizontalAlignment = .center
                            nmButton23.setTitleColor(UIColor.black, for: .normal)
                            nmButton23.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 40  && missionYapilabilmedurumu == 24){nmButton24.isEnabled = true
                            nmButton24.setTitle("Stoneclaw| level : 40", for: .normal)
                            nmButton24.contentVerticalAlignment = .center
                            nmButton24.contentHorizontalAlignment = .center
                            nmButton24.setTitleColor(UIColor.black, for: .normal)
                            nmButton24.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 41  && missionYapilabilmedurumu == 25){nmButton25.isEnabled = true
                            nmButton25.setTitle("Skyblade| level : 41", for: .normal)
                            nmButton25.contentVerticalAlignment = .center
                            nmButton25.contentHorizontalAlignment = .center
                            nmButton25.setTitleColor(UIColor.black, for: .normal)
                            nmButton25.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 43  && missionYapilabilmedurumu == 26){nmButton26.isEnabled = true
                            nmButton26.setTitle("Bloodcleave| level : 43", for: .normal)
                            nmButton26.contentVerticalAlignment = .center
                            nmButton26.contentHorizontalAlignment = .center
                            nmButton26.setTitleColor(UIColor.black, for: .normal)
                            nmButton26.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 45  && missionYapilabilmedurumu == 27){nmButton27.isEnabled = true
                            nmButton27.setTitle("Moonshadow| level : 45", for: .normal)
                            nmButton27.contentVerticalAlignment = .center
                            nmButton27.contentHorizontalAlignment = .center
                            nmButton27.setTitleColor(UIColor.black, for: .normal)
                            nmButton27.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 47  && missionYapilabilmedurumu == 28){nmButton28.isEnabled = true
                            nmButton28.setTitle("Blackdeath| level : 47", for: .normal)
                            nmButton28.contentVerticalAlignment = .center
                            nmButton28.contentHorizontalAlignment = .center
                            nmButton28.setTitleColor(UIColor.black, for: .normal)
                            nmButton28.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 49  && missionYapilabilmedurumu == 29){nmButton29.isEnabled = true
                            nmButton29.setTitle("IronBroker| level : 49", for: .normal)
                            nmButton29.contentVerticalAlignment = .center
                            nmButton29.contentHorizontalAlignment = .center
                            nmButton29.setTitleColor(UIColor.black, for: .normal)
                            nmButton29.backgroundColor = UIColor.systemBrown
                        }
                        if( userLevel! >= 50  && missionYapilabilmedurumu == 30){nmButton30.isEnabled = true
                            nmButton30.setTitle("Thundergaze| level : 50", for: .normal)
                            nmButton30.contentVerticalAlignment = .center
                            nmButton30.contentHorizontalAlignment = .center
                            nmButton30.setTitleColor(UIColor.black, for: .normal)
                            nmButton30.backgroundColor = UIColor.systemBrown
                        }
                           
                      
                        
                        
                    
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
