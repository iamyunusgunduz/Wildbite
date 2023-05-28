//
//  WarCaseViewController.swift
//  wildbite
//
//  Created by Yunus Gündüz on 20.05.2023.
//

import UIKit
import Alamofire
import Kingfisher

class WarCaseViewController: UIViewController {

    @IBOutlet weak var kazananImage: UIImageView!
    @IBOutlet weak var kaybedenImage: UIImageView!
    
    @IBOutlet weak var kazananName: UILabel!
    @IBOutlet weak var kazananRace: UILabel!
    @IBOutlet weak var kazananLevel: UILabel!
    @IBOutlet weak var kazananDamage: UILabel!
    @IBOutlet weak var kazananPower: UILabel!
    @IBOutlet weak var kazananDefense: UILabel!
    @IBOutlet weak var kazananSpeed: UILabel!
    @IBOutlet weak var kazananHealth: UILabel!
    
    @IBOutlet weak var kaybedenName: UILabel!
    @IBOutlet weak var kaybedenRace: UILabel!
    @IBOutlet weak var kaybedenLevel: UILabel!
    @IBOutlet weak var kaybedenDamage: UILabel!
    @IBOutlet weak var kaybedenPower: UILabel!
    @IBOutlet weak var kaybedenDefense: UILabel!
    @IBOutlet weak var kaybedenSpeed: UILabel!
    @IBOutlet weak var kaybedenHealth: UILabel!
    
    @IBOutlet weak var expLabel: UILabel!
    @IBOutlet weak var goldLabel: UILabel!
    @IBOutlet weak var canLabel: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: - Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        let WarSaldiranUserName = UserDefaults.standard.string(forKey: "WarSaldiranUserName")
        let WarSaldiranUserRole = UserDefaults.standard.integer(forKey: "WarSaldiranUserRole")
        let WarSaldiranUserExp = UserDefaults.standard.integer(forKey: "WarSaldiranUserExp")
        let WarSaldiranUserLevel = UserDefaults.standard.integer(forKey: "WarSaldiranUserLevel")
        let WarSaldiranUserGold = UserDefaults.standard.integer(forKey: "WarSaldiranUserGold")
        let WarSaldiranUserCurrentHealth = UserDefaults.standard.integer(forKey: "WarSaldiranUserCurrentHealth")
        let WarSaldiranUserMaximumHealth = UserDefaults.standard.integer(forKey: "WarSaldiranUserMaximumHealth")
        let WarSaldiranUserCurrentEnergy = UserDefaults.standard.integer(forKey: "WarSaldiranUserCurrentEnergy")
        let WarSaldiranUserMaximumEnergy = UserDefaults.standard.integer(forKey: "WarSaldiranUserMaximumEnergy")
        let WarSaldiranUserNightMissionState = UserDefaults.standard.integer(forKey: "WarSaldiranUserNightMissionState")
        let WarSaldiranUserTotalDamage = UserDefaults.standard.integer(forKey: "WarSaldiranUserTotalDamage")
        let WarSaldiranUserPower = UserDefaults.standard.integer(forKey: "WarSaldiranUserPower")
        let WarSaldiranUserDefense = UserDefaults.standard.integer(forKey: "WarSaldiranUserDefense")
        let WarSaldiranUserSpeed = UserDefaults.standard.integer(forKey: "WarSaldiranUserSpeed")
        let WarSaldiranUserRacename = UserDefaults.standard.integer(forKey: "WarSaldiranUserRacename")
        let WarSaldiranUserImage = UserDefaults.standard.string(forKey: "WarSaldiranUserImage")
        let usertoken = UserDefaults.standard.string(forKey: "userToken")
        
        
        
        
        let WarSavunanUserName = UserDefaults.standard.string(forKey: "WarSavunanUserName")
        let WarSavunanUserRole = UserDefaults.standard.integer(forKey: "WarSavunanUserRole")
        let WarSavunanUserExp = UserDefaults.standard.integer(forKey: "WarSavunanUserExp")
        let WarSavunanUserLevel = UserDefaults.standard.integer(forKey: "WarSavunanUserLevel")
        let WarSavunanUserGold = UserDefaults.standard.integer(forKey: "WarSavunanUserGold")
        let WarSavunanUserCurrentHealth = UserDefaults.standard.integer(forKey: "WarSavunanUserCurrentHealth")
        let WarSavunanUserMaximumHealth = UserDefaults.standard.integer(forKey: "WarSavunanUserMaximumHealth")
        let WarSavunanUserCurrentEnergy = UserDefaults.standard.integer(forKey: "WarSavunanUserCurrentEnergy")
        let WarSavunanUserMaximumEnergy = UserDefaults.standard.integer(forKey: "WarSavunanUserMaximumEnergy")
        
        let WarSavunanUserTotalDamage = UserDefaults.standard.integer(forKey: "WarSavunanUserTotalDamage")
        let WarSavunanUserPower = UserDefaults.standard.integer(forKey: "WarSavunanUserPower")
        let WarSavunanUserDefense = UserDefaults.standard.integer(forKey: "WarSavunanUserDefense")
        let WarSavunanUserSpeed = UserDefaults.standard.integer(forKey: "WarSavunanUserSpeed")
        let WarSavunanUserImage = UserDefaults.standard.string(forKey: "WarSavunanUserImage")
        let WarSavunanUserRacename = UserDefaults.standard.string(forKey: "WarSavunanUserRacename")
        
        
        let levelFarki = Int(WarSaldiranUserLevel - WarSavunanUserLevel )
        let canFarki = Int(WarSaldiranUserCurrentHealth - WarSavunanUserMaximumHealth)
        let enerjiFarki = Int(WarSaldiranUserCurrentEnergy - WarSavunanUserMaximumEnergy)
        let damageFarki = Int(WarSaldiranUserTotalDamage - WarSavunanUserTotalDamage)
        let saldiriFarki = Int(WarSaldiranUserPower - WarSavunanUserPower)
        let savunmaFarki = Int(WarSaldiranUserDefense - WarSavunanUserDefense)
        let hizFarki = Int(WarSaldiranUserSpeed - WarSavunanUserSpeed)
        var kazanan = "-"
        
        dump("Level Farki: \(levelFarki)")
        dump("Can Farki: \(canFarki)")
        dump("Enerji Farki: \(enerjiFarki)")
        dump("Damage Farki: \(damageFarki)")
        dump("Saldiri Farki: \(saldiriFarki)")
        dump("Savunma Farki: \(savunmaFarki)")
        dump("Hiz Farki: \(hizFarki)")
                           if(damageFarki >= 0){kazanan = "saldiran"} else {kazanan = "savunan"} // şimdilik kazanan toplam damage ile belirleniyor
        print("Kazanan = \(kazanan)")
        let headers: HTTPHeaders = [
            .authorization(bearerToken: usertoken!),
            .accept("application/json")
        ]
        
        switch kazanan{
            case "saldiran":   //MARK: saldiran kazandi Case
                
              
                kazananName.text = "\(WarSaldiranUserName!)"
                if(WarSaldiranUserRacename == 1){kazananRace.text = "Avcı"}
                if(WarSaldiranUserRacename == 2){kazananRace.text = "KurtAdam"}
                if(WarSaldiranUserRacename == 3){kazananRace.text = "Vampir"}
                if(WarSaldiranUserRacename == 4){kazananRace.text = "Cadı"}
                kazananLevel.text = "\(WarSaldiranUserLevel)"
                kazananDamage.text = "\(WarSaldiranUserTotalDamage)"
                kazananPower.text = "\(WarSaldiranUserPower)"
                kazananDefense.text = "\(WarSaldiranUserDefense)"
                kazananSpeed.text = "\(WarSaldiranUserSpeed)"
              
               
               
                kaybedenName.text = "   \(WarSavunanUserName!)"
                if(WarSavunanUserRacename == "1"){kaybedenRace.text = "Avcı"}
                if(WarSavunanUserRacename == "2"){kaybedenRace.text = "KurtAdam"}
                if(WarSavunanUserRacename == "3"){kaybedenRace.text = "Vampir"}
                if(WarSavunanUserRacename == "4"){kaybedenRace.text = "Cadı"}
                kaybedenLevel.text = "\(WarSavunanUserLevel)"
                kaybedenDamage.text = "\(WarSavunanUserTotalDamage)"
                kaybedenPower.text = "\(WarSavunanUserPower)"
                kaybedenDefense.text = "\(WarSavunanUserDefense)"
                kaybedenSpeed.text = "\(WarSavunanUserSpeed)"
                kaybedenHealth.text = "\(WarSavunanUserMaximumHealth)"
            
                
              
                let urlKazanan = URL(string: "\(WarSaldiranUserImage ?? "adasd")")
                let urlSavunan = URL(string: "\(WarSavunanUserImage ?? "asdas")")
            DispatchQueue.main.async{
                self.kazananImage.kf.setImage(with: urlKazanan)
                self.kaybedenImage.kf.setImage(with: urlSavunan)
                
                
            }
                //MARK: api  start
                 
                
                var kazanilanCan =  (WarSavunanUserMaximumHealth * 30 ) / 100
                var kazanilanAltin =  (WarSavunanUserGold * 20 ) / 100
                var kazanilanExp:Int
                kazananHealth.text = "\(WarSaldiranUserCurrentHealth+kazanilanCan)"
                if(levelFarki >= 0){
                    kazanilanExp =  (WarSavunanUserTotalDamage * 10) / 100
                }else{
                    kazanilanExp =  (WarSavunanUserTotalDamage * 15 ) / 100
                }
                    
               
         
                let warParameters = WarModelYapi(exp: kazanilanExp, gold: kazanilanAltin, current_health: kazanilanCan, maximum_health: 0, current_energy: -5, maximum_energy: 0, level: 0, war_total: 1, war_total_win: 1, war_total_lose: 0, war_total_gold: kazanilanAltin)
                
              AF.request("http://yunusgunduz.site/wildbite/public/api/war",
                         method: .put,
                         parameters: warParameters,
                         headers: headers)
              .validate(statusCode: 200..<500)
              .validate(contentType: ["application/json"])
              .responseData { [self]  response in
                  debugPrint(response)
                  switch response.result {
                  case .success:
                          let warResponse = try? JSONDecoder().decode(WarModel.self,  from: response.data!)
                          debugPrint(warResponse!)
                          expLabel.text = "Tecrube: +\(kazanilanExp)"
                          goldLabel.text = "Altın: +\(kazanilanAltin)"
                          canLabel.text = "Can +\(kazanilanCan)"
                          UserDefaults.standard.set(WarSaldiranUserCurrentEnergy - 5, forKey: "WarSaldiranUserCurrentEnergy")
                          UserDefaults.standard.set(WarSaldiranUserGold+kazanilanAltin,forKey: "WarSaldiranUserGold")
                          UserDefaults.standard.set(WarSaldiranUserCurrentHealth+kazanilanCan,forKey: "WarSaldiranUserCurrentHealth")
                          UserDefaults.standard.set(WarSaldiranUserExp + kazanilanExp,forKey: "WarSaldiranUserExp")

                          
                  case let .failure(error):
                      print(error.errorDescription!)
                      print("hata")
                  }
              }
                 
                
            case "savunan": //MARK: - savunan kazandi Case
                
                kazananName.text = "\(WarSavunanUserName!)"
                if(WarSavunanUserRacename == "1"){kazananRace.text = "Avcı"}
                if(WarSavunanUserRacename == "2"){kazananRace.text = "KurtAdam"}
                if(WarSavunanUserRacename == "3"){kazananRace.text = "Vampir"}
                if(WarSavunanUserRacename == "4"){kazananRace.text = "Cadı"}
                kazananLevel.text = "\(WarSavunanUserLevel)"
                kazananDamage.text = "\(WarSavunanUserTotalDamage)"
                kazananPower.text = "\(WarSavunanUserPower)"
                kazananDefense.text = "\(WarSavunanUserDefense)"
                kazananSpeed.text = "\(WarSavunanUserSpeed)"
                kazananHealth.text = "\(WarSavunanUserMaximumHealth)"
                
                // kaybeden tarafi
                kaybedenName.text = "   \(WarSaldiranUserName!)"
                if(WarSaldiranUserRacename == 1){kaybedenRace.text = "Avcı"}
                if(WarSaldiranUserRacename == 2){kaybedenRace.text = "KurtAdam"}
                if(WarSaldiranUserRacename == 3){kaybedenRace.text = "Vampir"}
                if(WarSaldiranUserRacename == 4){kaybedenRace.text = "Cadı"}
                kaybedenLevel.text = "\(WarSaldiranUserLevel)"
                kaybedenDamage.text = "\(WarSaldiranUserTotalDamage)"
                kaybedenPower.text = "\(WarSaldiranUserPower)"
                kaybedenDefense.text = "\(WarSaldiranUserDefense)"
                kaybedenSpeed.text = "\(WarSaldiranUserSpeed)"
              
                
                // image
                    let urlKazanan = URL(string: "\(WarSavunanUserImage!)")
                    let urlSavunan = URL(string: "\(WarSaldiranUserImage!)")
                DispatchQueue.main.async{
                    self.kazananImage.kf.setImage(with: urlKazanan)
                    self.kaybedenImage.kf.setImage(with: urlSavunan)
                }
                //MARK:  api  start
                var kaybedilenCan =  (WarSavunanUserMaximumHealth * 30 ) / 100
                var kaybedilenAltin =  (WarSavunanUserGold * 20 ) / 100
               // kaybedenHealth.text = "\(WarSaldiranUserCurrentHealth - kaybedilenCan)"
                kaybedenHealth.text = "\(WarSaldiranUserCurrentHealth - kaybedilenCan)"
                
                       let warParameters = WarModelYapi(exp: 0, gold: -kaybedilenAltin, current_health: -kaybedilenCan, maximum_health: 0, current_energy: -10, maximum_energy: 0, level: 0, war_total: 1, war_total_win: 0, war_total_lose: 1, war_total_gold: 0)
                       
              AF.request("http://yunusgunduz.site/wildbite/public/api/war",
                         method: .put,
                         parameters: warParameters,
                         headers: headers)
              .validate(statusCode: 200..<500)
              .validate(contentType: ["application/json"])
              .responseData { [self]  response in
                  debugPrint(response)
                  switch response.result {
                  case .success:
                          let warResponse = try? JSONDecoder().decode(WarModel.self,  from: response.data!)
                          debugPrint(warResponse!)
                          expLabel.text = ""
                          goldLabel.text = "Altın: -\(kaybedilenAltin)"
                          canLabel.text = ""
                          UserDefaults.standard.set(WarSaldiranUserCurrentEnergy - 10, forKey: "WarSaldiranUserCurrentEnergy")
                          UserDefaults.standard.set(WarSaldiranUserGold-kaybedilenAltin,forKey: "WarSaldiranUserGold")
                          UserDefaults.standard.set(WarSaldiranUserCurrentHealth-kaybedilenCan,forKey: "WarSaldiranUserCurrentHealth")
                          
                          
                  case let .failure(error):
                      print(error.errorDescription!)
                      print("hata")
                  }
              }
             default:
                break
        }
       
           
        
        
       
             
        }
        
      
    }


