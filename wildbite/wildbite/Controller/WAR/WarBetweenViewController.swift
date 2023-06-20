//
//  WarBetweenViewController.swift
//  wildbite
//
//  Created by Yunus Gündüz on 19.06.2023.
//

import UIKit
import Alamofire
import Kingfisher
import SwiftyGif

class WarBetweenViewController: UIViewController {
    
  
    var roundSayisi = 1
   
    @IBOutlet weak var sonucStackView: UIStackView!
    
    @IBOutlet weak var goldLabel: UILabel!
    
    @IBOutlet weak var canLabel: UILabel!
    
    @IBOutlet weak var expLabel: UILabel!
    
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
    
    
    
    
    @IBOutlet weak var saldiranProgressView: UIProgressView!
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var savunanCanLabel: UILabel!
    @IBOutlet weak var saldiranCanLabel: UILabel!
    @IBOutlet weak var savunanImage: UIImageView!
    @IBOutlet weak var saldiranImage: UIImageView!
    
    @IBOutlet weak var saldirButtonLabel: UIButton!
    
    @IBOutlet weak var savunButtonLabel: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background.png")!)
        
    }
    override func viewWillAppear(_ animated: Bool) {
       
        roundLabel.text = "Round 1"
        saldiranCanLabel.text = "Can: \(WarSaldiranUserCurrentHealth)"
        savunanCanLabel.text = "Can: \(WarSavunanUserMaximumHealth)"
     
        beklemeyeGecTwoPeople()
    }
    
    
    
    @IBAction func savunButton(_ sender: Any) {
        var saldiriDegeriHesapla = ((WarSavunanUserPower * WarSavunanUserSpeed) - WarSaldiranUserDefense)
        WarSaldiranUserCurrentHealth = WarSaldiranUserCurrentHealth + (saldiriDegeriHesapla / 3)
    
       // savunanImage.transform =  savunanImage.transform.scaledBy(x: 1, y: 1)
       
        rakipSaldirisi()
       
      
    }
    @IBAction func saldirButton(_ sender: Any) {
        karakterSaldiri()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
 
            if(kazandiKaybetti() == 0){
                beklemeyeGecSaldiri()
            }else{
                kazandiKaybetti()
            }
           
        }
        
    }
    func karakterSaldiri(){
        
      
        
        saldirButtonLabel.isEnabled = false
        savunButtonLabel.isEnabled = false
        do {
           
            let gifTekme = try UIImage(gifName: "00Rkick.gif")
            let gifSavun = try UIImage(gifName: "00savun.gif")
            savunanImage.transform = CGAffineTransform(scaleX: -1, y: 1)
            saldiranImage.transform = CGAffineTransform(translationX: 130.0, y: 0.0)
            self.saldiranImage.setGifImage(gifTekme, loopCount: 1)
            self.savunanImage.setGifImage(gifSavun, loopCount: 1)
            var saldiriDegeriHesapla = ((WarSaldiranUserPower * WarSaldiranUserSpeed) - WarSavunanUserDefense)
            if(saldiriDegeriHesapla > 0){   WarSavunanUserMaximumHealth -= saldiriDegeriHesapla }
         
            saldiranCanLabel.text = "Can: \(WarSaldiranUserCurrentHealth)"
            savunanCanLabel.text = "Can: \(WarSavunanUserMaximumHealth)"
           
            if(WarSavunanUserMaximumHealth > 0){
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) { [self] in
                    rakipSaldirisi()
                }
            }
            
            
            
        } catch {
            print(error)
        }
        
    }
    func rakipSaldirisi(){
        saldirButtonLabel.isEnabled = false
        savunButtonLabel.isEnabled = false
        savunanImage.transform = CGAffineTransform(translationX: -130.0, y: 0.0)
        do{
            
         
            saldiranImage.setGifImage(try UIImage(gifName: "00savun.gif"))
            savunanImage.setGifImage(try UIImage(gifName: "00Lkick.gif"))
            var saldiriDegeriHesapla = ((WarSavunanUserPower * WarSavunanUserSpeed) - WarSaldiranUserDefense)
            if(saldiriDegeriHesapla > 0){   WarSaldiranUserCurrentHealth -= saldiriDegeriHesapla }
         
            saldiranCanLabel.text = "Can: \(WarSaldiranUserCurrentHealth)"
            savunanCanLabel.text = "Can: \(WarSavunanUserMaximumHealth)"
           
        }catch{
            
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
          
            if(kazandiKaybetti() == 0){
                beklemeyeGecTwoPeople ()
            }else{
                kazandiKaybetti()
            }
            
        }
        
    }
    func kazandiKaybetti() -> Int{
        let headers: HTTPHeaders = [
            .authorization(bearerToken: usertoken!),
            .accept("application/json")
        ]
        do {
            
        let kazandiGIF = try UIImage(gifName: "Victory.gif")
        let kaybettiGIF = try UIImage(gifName: "YouLose.gif")
        let bekleGIF = try UIImage(gifName: "00bekleyis.gif")
        let olduGIF = try UIImage(gifName: "00olus.gif", levelOfIntegrity:1)
         
            
            if(WarSaldiranUserCurrentHealth <= 0){
                sonucStackView.isHidden = false
                self.saldiranImage.setGifImage(kaybettiGIF, loopCount: 1)
                self.savunanImage.setGifImage(bekleGIF, loopCount: -1)
                savunanImage.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
                savunanImage.transform = CGAffineTransform(scaleX: -1, y: 1)
                print("kaybettik")
                let kaybedilenCan =  (WarSavunanUserMaximumHealth * 15 ) / 100
                let kaybedilenAltin =  (WarSavunanUserGold * 10 ) / 100
               // kaybedenHealth.text = "\(WarSaldiranUserCurrentHealth - kaybedilenCan)"
                
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
                goldLabel.text
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
                          expLabel.text = "+0"
                          goldLabel.text = "- \(kaybedilenAltin)"
                          canLabel.text = "+0"
                          UserDefaults.standard.set(WarSaldiranUserCurrentEnergy - 10, forKey: "WarSaldiranUserCurrentEnergy")
                          UserDefaults.standard.set(WarSaldiranUserGold-kaybedilenAltin,forKey: "WarSaldiranUserGold")
                          UserDefaults.standard.set(WarSaldiranUserCurrentHealth-kaybedilenCan,forKey: "WarSaldiranUserCurrentHealth")
                          
                          
                  case let .failure(error):
                      print(error.errorDescription!)
                      print("hata")
                  }
              }
                return -1
            }
            
            if(WarSavunanUserMaximumHealth <= 0){
                sonucStackView.isHidden = false
                saldiranImage.setGifImage(kazandiGIF, loopCount: 1)
                savunanImage.setGifImage(olduGIF, loopCount: 1)
                
                savunanImage.transform = CGAffineTransform(translationX: 0, y: 0)
                saldiranImage.transform = CGAffineTransform(scaleX: 1, y: 1)
                saldirButtonLabel.isEnabled = false
                savunButtonLabel.isEnabled = false
                print("kazandik")
                
                let kazanilanCan = abs( (WarSavunanUserMaximumHealth * 30 ) / 100 )
                let kazanilanAltin = abs(  (WarSavunanUserGold * 5 ) / 100)
                let kazanilanExp = abs( (WarSavunanUserLevel * 4) )
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
                return 1
            }
            
        }catch {
     print(error)
         }
         
        return 0
        }
  
    func beklemeyeGecSaldiri(){
       
        do {
            saldiranImage.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
            savunanImage.transform = CGAffineTransform(scaleX: -1, y: 1)
            let gifbekle = try UIImage(gifName: "00bekleyis.gif")
           
            self.saldiranImage.setGifImage(gifbekle, loopCount: -1)
            self.savunanImage.setGifImage(gifbekle, loopCount: -1)
             
        } catch {
            print(error)
        }
       
        roundSayisi = roundSayisi + 1
        roundLabel.text = "Round \(roundSayisi)"
    }
    
    func beklemeyeGecTwoPeople(){
        saldirButtonLabel.isEnabled = true
        savunButtonLabel.isEnabled = true
        do {
            saldiranImage.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
            savunanImage.transform = CGAffineTransform(scaleX: -1, y: 1)
            let gifbekle = try UIImage(gifName: "00bekleyis.gif")
           
            self.saldiranImage.setGifImage(gifbekle, loopCount: -1)
            self.savunanImage.setGifImage(gifbekle, loopCount: -1)
             
        } catch {
            print(error)
        }
       
        roundSayisi = roundSayisi + 1
        roundLabel.text = "Round \(roundSayisi)"
    }
    
}
 
