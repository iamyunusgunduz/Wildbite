//
//  NightMissionViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 10.04.2023.
//

import UIKit

class NightMissionViewController: UIViewController {

    let userLevel = 10
    
    
    @IBOutlet weak var btnLvl1: UIButton!
    @IBOutlet weak var btnLvl5: UIButton!
    @IBOutlet weak var btnLvl10: UIButton!
    @IBOutlet weak var btnLvl15: UIButton!
    @IBOutlet weak var btnLvl20: UIButton!
    @IBOutlet weak var btnLvl25: UIButton!
    @IBOutlet weak var btnLvl30: UIButton!
    @IBOutlet weak var btnLvl35: UIButton!
   
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
       // btnLv1.titleLabel?.text  =  "asdasd"
    }
    
    override func viewWillAppear(_ animated: Bool) {
      
    }
    
    
    
    
    @IBAction func btnLvl1Click(_ sender: Any) {
        UserDefaults.standard.set(1, forKey: "NightMissionType")
        UserDefaults.standard.set("Hunter1", forKey: "NightHunterName")
        UserDefaults.standard.set(10, forKey: "NightHunterPow")
        
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
        
        
    }
    @IBAction func btnLvl5Click(_ sender: Any) {
        UserDefaults.standard.set(5, forKey: "NightMissionType")
        UserDefaults.standard.set("Hunter2", forKey: "NightHunterName")
        UserDefaults.standard.set(50, forKey: "NightHunterPow")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btnLvl10Click(_ sender: Any) {
        UserDefaults.standard.set(10, forKey: "NightMissionType")
        UserDefaults.standard.set("Hunter3", forKey: "NightHunterName")
        UserDefaults.standard.set(100, forKey: "NightHunterPow")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btnLvl15Click(_ sender: Any) {
        UserDefaults.standard.set(15, forKey: "NightMissionType")
     
        UserDefaults.standard.set("Hunter4", forKey: "NightHunterName")
        UserDefaults.standard.set(150, forKey: "NightHunterPow")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btnLvl20Click(_ sender: Any) {
        UserDefaults.standard.set(20, forKey: "NightMissionType")
        UserDefaults.standard.set("Hunter5", forKey: "NightHunterName")
        UserDefaults.standard.set(200, forKey: "NightHunterPow")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btnLvl25Click(_ sender: Any) {
        UserDefaults.standard.set(25, forKey: "NightMissionType")
        UserDefaults.standard.set("Hunter6", forKey: "NightHunterName")
        UserDefaults.standard.set(250, forKey: "NightHunterPow")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btnLvl30Click(_ sender: Any) {
        UserDefaults.standard.set(30, forKey: "NightMissionType")
        UserDefaults.standard.set("Hunter7", forKey: "NightHunterName")
        UserDefaults.standard.set(300, forKey: "NightHunterPow")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    @IBAction func btnLvl35Click(_ sender: Any) {
        UserDefaults.standard.set(35, forKey: "NightMissionType")
        UserDefaults.standard.set("Hunter8", forKey: "NightHunterName")
        UserDefaults.standard.set(350, forKey: "NightHunterPow")
        performSegue(withIdentifier: "NightMissionToCase", sender: nil)
    }
    

}
