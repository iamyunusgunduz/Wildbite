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
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        
        switch kazanan{
            case "saldiran":
                // kazanan tarafi
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
                kazananHealth.text = "\(WarSaldiranUserCurrentHealth)"
                
                // kaybeden tarafi
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
                
                // image
                let urlKazanan = URL(string: "\(WarSaldiranUserImage!)")
                let urlSavunan = URL(string: "\(WarSavunanUserImage!)")
            DispatchQueue.main.async{
                self.kazananImage.kf.setImage(with: urlKazanan)
                self.kaybedenImage.kf.setImage(with: urlSavunan)
            }
                
            case "savunan":
                // kazanan tarafi
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
                kaybedenHealth.text = "\(WarSaldiranUserMaximumHealth)"
                
                // image
                    let urlKazanan = URL(string: "\(WarSavunanUserImage!)")
                    let urlSavunan = URL(string: "\(WarSaldiranUserImage!)")
                DispatchQueue.main.async{
                    self.kazananImage.kf.setImage(with: urlKazanan)
                    self.kaybedenImage.kf.setImage(with: urlSavunan)
                }
                
            default:
                break
        }
       
           
            
             
        }
        
      
    }


