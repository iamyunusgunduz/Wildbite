//
//  WarCaseViewController.swift
//  wildbite
//
//  Created by Yunus Gündüz on 20.05.2023.
//

import UIKit
import Alamofire
import Kingfisher
import SwiftyGif
class WarCaseViewController: UIViewController {

    @IBOutlet weak var kazananImage: UIImageView!
    @IBOutlet weak var kaybedenImage: UIImageView!
    
    @IBOutlet weak var roundSayisiLabel: UILabel!
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
    
    @IBOutlet weak var kazKayImage: UIImageView!
    
    
    
    
    
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
        var WarSaldiranUserCurrentHealth = UserDefaults.standard.integer(forKey: "WarSaldiranUserCurrentHealth")
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
        
        //dump("Debug: saldiran Image: \(String(describing: WarSaldiranUserImage))")
        
        
        let WarSavunanUserName = UserDefaults.standard.string(forKey: "WarSavunanUserName")
        let WarSavunanUserRole = UserDefaults.standard.integer(forKey: "WarSavunanUserRole")
        let WarSavunanUserExp = UserDefaults.standard.integer(forKey: "WarSavunanUserExp")
        let WarSavunanUserLevel = UserDefaults.standard.integer(forKey: "WarSavunanUserLevel")
        let WarSavunanUserGold = UserDefaults.standard.integer(forKey: "WarSavunanUserGold")
        let WarSavunanUserCurrentHealth = UserDefaults.standard.integer(forKey: "WarSavunanUserCurrentHealth")
        var WarSavunanUserMaximumHealth = UserDefaults.standard.integer(forKey: "WarSavunanUserMaximumHealth")
        let WarSavunanUserCurrentEnergy = UserDefaults.standard.integer(forKey: "WarSavunanUserCurrentEnergy")
        let WarSavunanUserMaximumEnergy = UserDefaults.standard.integer(forKey: "WarSavunanUserMaximumEnergy")
        
        let WarSavunanUserTotalDamage = UserDefaults.standard.integer(forKey: "WarSavunanUserTotalDamage")
        let WarSavunanUserPower = UserDefaults.standard.integer(forKey: "WarSavunanUserPower")
        let WarSavunanUserDefense = UserDefaults.standard.integer(forKey: "WarSavunanUserDefense")
        let WarSavunanUserSpeed = UserDefaults.standard.integer(forKey: "WarSavunanUserSpeed")
        let WarSavunanUserImage = UserDefaults.standard.string(forKey: "WarSavunanUserImage")
      //  let WarSavunanUserRacename = UserDefaults.standard.string(forKey: "WarSavunanUserRacename")
        
        
        let levelFarki = Int(WarSaldiranUserLevel - WarSavunanUserLevel )
        let canFarki = Int(WarSaldiranUserCurrentHealth - WarSavunanUserMaximumHealth)
       // let enerjiFarki = Int(WarSaldiranUserCurrentEnergy - WarSavunanUserMaximumEnergy)
        let damageFarki = Int(WarSaldiranUserTotalDamage - WarSavunanUserTotalDamage)
        
        let saldiriFarki = Int(   (WarSaldiranUserPower * WarSaldiranUserSpeed ) - (   WarSavunanUserPower * WarSavunanUserSpeed ))
        let savunmaFarki = Int(   (WarSaldiranUserDefense * WarSaldiranUserSpeed ) - (   (WarSavunanUserDefense * WarSavunanUserSpeed)))
       // let hizFarki = Int(WarSaldiranUserSpeed - WarSavunanUserSpeed)
        var kazanan = "-"
        print("yWarSaldiranUserCurrentHealth \(WarSaldiranUserCurrentHealth)")
        // user leve
        let verilenHasar =  (saldiriFarki - savunmaFarki)
      //  print("   verilenHasar   = \(verilenHasar )")
        var raundSayisi = 0
        var saldiranKazandi = false
        var savunanKazandi = false
        if(verilenHasar < 0 ){savunanKazandi = true}

        if(verilenHasar == 0){saldiranKazandi = true}
        repeat{ //MARK: -savaşıyorlar

            WarSaldiranUserCurrentHealth -= verilenHasar
            WarSavunanUserMaximumHealth -= verilenHasar
            
            if(WarSaldiranUserCurrentHealth < 0 ){savunanKazandi = true}
   
            if(WarSavunanUserMaximumHealth < 0){saldiranKazandi = true}
            print("WarSaldiran  Anlik Can = \(WarSaldiranUserCurrentHealth)")
            print("WarSavunan  Anlik Can = \(WarSavunanUserMaximumHealth )")
            raundSayisi += 1
        }while(saldiranKazandi == false && savunanKazandi == false)
         if(saldiranKazandi == true){kazanan = "saldiran"}
         if(savunanKazandi == true){kazanan = "savunan"}
        roundSayisiLabel.text = "\(raundSayisi) Round Sürdü"
        //dump("Level Farki: \(levelFarki)")
        //dump("Can Farki: \(canFarki)")
       // dump("Enerji Farki: \(enerjiFarki)")
        //dump("Damage Farki: \(damageFarki)")
       // dump("Saldiri Farki: \(saldiriFarki)")
       // dump("Savunma Farki: \(savunmaFarki)")
       // dump("Hiz Farki: \(hizFarki)")
                         
       // print("Kazanan = \(kazanan)")
        let headers: HTTPHeaders = [
            .authorization(bearerToken: usertoken!),
            .accept("application/json")
        ]
        
        switch kazanan{
            case "saldiran":   //MARK: saldiran kazandi Case
                
                
                do {
                    let gif = try UIImage(gifName: "Victory.gif") // YouLose  Victory
                    kazKayImage.setGifImage(gif,loopCount: 2)
                } catch {
                    print(error)
                }
                kazananName.text = "\(WarSaldiranUserName!)"
                kazananRace.text = "klan\(WarSaldiranUserRacename)"
                
                kazananLevel.text = "\(WarSaldiranUserLevel)"
                kazananDamage.text = "\(WarSaldiranUserTotalDamage)"
                kazananPower.text = "\(UserDefaults.standard.integer(forKey: "WarSaldiranUserMaximumHealth"))"
                kazananDefense.text = "\(WarSaldiranUserDefense)"
                kazananSpeed.text = "\(WarSaldiranUserSpeed)"
              
             
               
                kaybedenName.text = "   \(WarSavunanUserName!)"
                
              kaybedenRace.text = "klan\(WarSaldiranUserRacename)"
                kaybedenLevel.text = "\(WarSavunanUserLevel)"
                kaybedenDamage.text = "\(WarSavunanUserTotalDamage)"
                kaybedenPower.text = "\(WarSavunanUserPower)"
                kaybedenDefense.text = "\(WarSavunanUserDefense)"
                kaybedenSpeed.text = "\(WarSavunanUserSpeed)"
                kaybedenHealth.text = "\(WarSavunanUserMaximumHealth)"
            
                
                //  let url = URL(string: "https://backhub.site/wildbite/image/user/idle/\(profileModelresponse!.user.image).gif")
                let urlKazanan = URL(string: "https://backhub.site/wildbite/image/user/idle/\(WarSaldiranUserImage ?? "00").gif")
                let urlSavunan = URL(string: "https://backhub.site/wildbite/image/user/idle/\(WarSavunanUserImage ?? "00").gif")
                
               // dump("Debug: Kazanan Image: \(String(describing: urlKazanan))")
                DispatchQueue.main.async{ [self] in
                    kazananImage.setGifFromURL(urlKazanan!,showLoader: true)
                        //kaybedenImage.transform = CGAffineTransform(rotationAngle: CGFloat.pi) 180 derece donderdi
                    kaybedenImage.transform = CGAffineTransform(scaleX: -1, y: 1)
                    
                    kaybedenImage.setGifFromURL(urlKazanan!,showLoader: true)
                
                
                
            }
                //MARK: api  start
                 
                
                let kazanilanCan = abs( (WarSavunanUserMaximumHealth * 30 ) / 100 )
                let kazanilanAltin = abs(  (WarSavunanUserGold * 5 ) / 100)
                let kazanilanExp = abs( (WarSavunanUserLevel * 4) )
                kazananHealth.text = "\(WarSaldiranUserCurrentHealth+kazanilanCan)"
              
                var userLV = WarSaldiranUserLevel
                var userinLevelExpHesabi = WarSaldiranUserExp + kazanilanExp
                if(userinLevelExpHesabi < 50){userLV = 1}
                else if(userinLevelExpHesabi < 125){userLV = 2}
                else if(userinLevelExpHesabi < 250){userLV = 3}
                else if(userinLevelExpHesabi < 370){userLV = 4}
                else if(userinLevelExpHesabi < 500){userLV = 5}
                else if(userinLevelExpHesabi < 750){userLV = 6}
                else if(userinLevelExpHesabi < 1200){userLV = 7}
                else if(userinLevelExpHesabi < 2300){userLV = 8}
                else  if(userinLevelExpHesabi < 3450){userLV = 9}
                else if(userinLevelExpHesabi < 4700){userLV = 10}
                else if(userinLevelExpHesabi < 5900){userLV = 11}
                else  if(userinLevelExpHesabi < 7200){userLV = 12}
                else  if(userinLevelExpHesabi < 9600){userLV = 13}
                else if(userinLevelExpHesabi <  12000){userLV = 14}
                else  if(userinLevelExpHesabi < 13500){userLV = 15}
                else  if(userinLevelExpHesabi < 14600){userLV = 16}
                else  if(userinLevelExpHesabi < 19400){userLV = 17}
                else if(userinLevelExpHesabi  < 24500){userLV = 14}
                else  if(userinLevelExpHesabi < 35500){userLV = 15}
                else  if(userinLevelExpHesabi < 47100){userLV = 16}
                else  if(userinLevelExpHesabi < 59700){userLV = 17}
                else{
                     userLV = WarSaldiranUserLevel
                }
                let warParameters = WarModelYapi(exp: kazanilanExp, gold: kazanilanAltin, current_health: kazanilanCan, maximum_health: 0, current_energy: -5, maximum_energy: 0, level: userLV, war_total: 1, war_total_win: 1, war_total_lose: 0, war_total_gold: kazanilanAltin)
                UserDefaults.standard.set(userLV, forKey: "WarSaldiranUserLevel")
               
              AF.request("http://backhub.site/wildbite/public/api/war",
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
                          debugPrint(warResponse ?? warResponse.debugDescription )
                          expLabel.text = "+ \(kazanilanExp)"
                          goldLabel.text = "+ \(kazanilanAltin)"
                          canLabel.text = "+ \(kazanilanCan)"
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
                do {
                    let gif = try UIImage(gifName: "YouLose.gif") // YouLose  Victory
                    kazKayImage.setGifImage(gif,loopCount: 2)
                } catch {
                    print(error)
                }
                kazananName.text = "\(WarSavunanUserName!)"
             
             //   kazananRace.text = "klan\(WarSavunanUserRacename!)"
                kazananLevel.text = "\(WarSavunanUserLevel)"
                kazananDamage.text = "\(WarSavunanUserTotalDamage)"
                kazananPower.text = "\(WarSavunanUserPower)"
                kazananDefense.text = "\(WarSavunanUserDefense)"
                kazananSpeed.text = "\(WarSavunanUserSpeed)"
                kazananHealth.text = "\(WarSavunanUserMaximumHealth)"
                
                // kaybeden tarafi
                kaybedenName.text = "   \(WarSaldiranUserName!)"
                kaybedenRace.text = "klan\(WarSaldiranUserRacename)"
                
                kaybedenLevel.text = "\(WarSaldiranUserLevel)"
                kaybedenDamage.text = "\(WarSaldiranUserTotalDamage)"
                kaybedenPower.text = "\(WarSaldiranUserPower)"
                kaybedenDefense.text = "\(WarSaldiranUserDefense)"
                kaybedenSpeed.text = "\(WarSaldiranUserSpeed)"
              
                
                // image
                let urlKazanan = URL(string: "https://backhub.site/wildbite/image/user/idle/\(WarSavunanUserImage ?? "00").gif")
                let urlSavunan = URL(string: "https://backhub.site/wildbite/image/user/idle/\(WarSaldiranUserImage ?? "00").gif")
                   
                DispatchQueue.main.async{ [self] in
                     kazananImage.setGifFromURL(urlKazanan!,showLoader: true)
                     kaybedenImage.setGifFromURL(urlSavunan!,showLoader: true)
                    kaybedenImage.transform = CGAffineTransform(scaleX: -1, y: 1)
                }
                //MARK:  api  start
                let kaybedilenCan =  (WarSavunanUserMaximumHealth * 15 ) / 100
                let kaybedilenAltin =  (WarSavunanUserGold * 10 ) / 100
               // kaybedenHealth.text = "\(WarSaldiranUserCurrentHealth - kaybedilenCan)"
                kaybedenHealth.text = "\(WarSaldiranUserCurrentHealth - kaybedilenCan)"
                let WarSaldiranUserLevel = UserDefaults.standard.integer(forKey: "WarSaldiranUserLevel")
                var userLV = WarSaldiranUserLevel
                let WarSaldiranUserExp = UserDefaults.standard.integer(forKey: "WarSaldiranUserExp")
                var userinLevelExpHesabi = WarSaldiranUserExp
                if(userinLevelExpHesabi < 50){userLV = 1}
                else if(userinLevelExpHesabi < 125){userLV = 2}
                else if(userinLevelExpHesabi < 250){userLV = 3}
                else if(userinLevelExpHesabi < 370){userLV = 4}
                else if(userinLevelExpHesabi < 500){userLV = 5}
                else if(userinLevelExpHesabi < 750){userLV = 6}
                else if(userinLevelExpHesabi < 1200){userLV = 7}
                else if(userinLevelExpHesabi < 2300){userLV = 8}
                else  if(userinLevelExpHesabi < 3450){userLV = 9}
                else if(userinLevelExpHesabi < 4700){userLV = 10}
                else if(userinLevelExpHesabi < 5900){userLV = 11}
                else  if(userinLevelExpHesabi < 7200){userLV = 12}
                else  if(userinLevelExpHesabi < 9600){userLV = 13}
                else if(userinLevelExpHesabi <  12000){userLV = 14}
                else  if(userinLevelExpHesabi < 13500){userLV = 15}
                else  if(userinLevelExpHesabi < 14600){userLV = 16}
                else  if(userinLevelExpHesabi < 19400){userLV = 17}
                else if(userinLevelExpHesabi  < 24500){userLV = 14}
                else  if(userinLevelExpHesabi < 35500){userLV = 15}
                else  if(userinLevelExpHesabi < 47100){userLV = 16}
                else  if(userinLevelExpHesabi < 59700){userLV = 17}
                else{
                     userLV = WarSaldiranUserLevel
                }
                 
                       let warParameters = WarModelYapi(exp: 0, gold: -kaybedilenAltin, current_health: -kaybedilenCan, maximum_health: 0, current_energy: -10, maximum_energy: 0, level: WarSaldiranUserLevel, war_total: 1, war_total_win: 0, war_total_lose: 1, war_total_gold: 0)
                       
              AF.request("http://backhub.site/wildbite/public/api/war",
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
                          debugPrint(warResponse ?? "savaşırken bişey oldu")
                          expLabel.text = "+ 0"
                          goldLabel.text = "\(kaybedilenAltin)"
                          canLabel.text = "+0"
                          UserDefaults.standard.set(WarSaldiranUserCurrentEnergy - 10, forKey: "WarSaldiranUserCurrentEnergy")
                          UserDefaults.standard.set(WarSaldiranUserGold-kaybedilenAltin,forKey: "WarSaldiranUserGold")
                          UserDefaults.standard.set(WarSaldiranUserCurrentHealth-kaybedilenCan,forKey: "WarSaldiranUserCurrentHealth")
                          
                          
                  case let .failure(error):
                      print(error.errorDescription!)
                      print("hata")
                  }
              }
             default:
                viewWillAppear(true)
                break
        }
       
           
        
        
       
     
        }
        
      
    }


