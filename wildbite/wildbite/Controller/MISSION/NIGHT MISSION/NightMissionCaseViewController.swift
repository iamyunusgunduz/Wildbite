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
    @IBOutlet weak var missionResult: UILabel!
    
    @IBOutlet weak var attactButton: UIButton!
    @IBOutlet weak var huntPow: UILabel!
    @IBOutlet weak var goldLabel: UILabel!
    
    @IBOutlet weak var missionMonsterImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func attackButton(_ sender: Any) {
        let nightMissionType = UserDefaults.standard.integer(forKey: "NightMissionType")
        
        let NightMissionUserLevel = UserDefaults.standard.integer(forKey: "NightMissionUserLevel")
        let NightMissionUserName = UserDefaults.standard.string(forKey: "NightMissionUserName")
        let NightMissionUserTotalDamage = UserDefaults.standard.integer(forKey: "NightMissionUserTotalDamage")
        let NightMissionUserHealth = UserDefaults.standard.integer(forKey: "NightMissionUserHealth")
        let NightMissionUserEnergy = UserDefaults.standard.integer(forKey: "NightMissionUserEnergy")
        
  
        
        
            if(NightMissionUserTotalDamage >= nightMissionType * 10){
               
                missionResult.text = "\(NightMissionUserName!) WON \n\n + \(nightMissionType * 3)  Exp"
               
                attactButton.isHidden = true
                missionResult.isHidden = false
                goldLabel.isHidden = false
            }else{
                missionResult.isHidden = false
                missionResult.text = "\(NightMissionUserName!) LOSE \n Health - \(nightMissionType * 10) \n Energy - \(nightMissionType * 5)"
                missionResult.textColor = UIColor.red
                
                
            }
            
            
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
     
        let nightMissionType = UserDefaults.standard.integer(forKey: "NightMissionType")
        
        let NightMissionUserLevel = UserDefaults.standard.integer(forKey: "NightMissionUserLevel")
        let NightMissionUserName = UserDefaults.standard.string(forKey: "NightMissionUserName")
        let NightMissionUserTotalDamage = UserDefaults.standard.integer(forKey: "NightMissionUserTotalDamage")
        let NightMissionUserHealth = UserDefaults.standard.integer(forKey: "NightMissionUserHealth")
        let NightMissionUserEnergy = UserDefaults.standard.integer(forKey: "NightMissionUserEnergy")
        
      
     
        let url = URL(string: "http://yunusgunduz.site/wildbite/image/missions/nightboss/\(nightMissionType).png")
        DispatchQueue.main.async{ [self] in
            missionMonsterImage.kf.setImage(with: url)
        }
        
        huntPow.text = "Monster Power: \(nightMissionType * 10 )"
        goldLabel.text = " +\(nightMissionType * 1000 ) GOLD"
        huntHealth.text = "Health : \(nightMissionType * 100 ) "
        
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
