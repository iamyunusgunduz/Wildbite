//
//  NightMissionCaseViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 10.04.2023.
//

import UIKit

class NightMissionCaseViewController: UIViewController {

    @IBOutlet weak var huntName: UILabel!
    
    @IBOutlet weak var huntPow: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
       // let nightMissionType = UserDefaults.standard.value(forKey: "NightMissionType") as! Int
        let nightHunterName = UserDefaults.standard.value(forKey: "NightHunterName")
        let nightHunterPow = UserDefaults.standard.value(forKey: "NightHunterPow") as! Int
     
        huntName.text = "Name \(nightHunterName!)"
        huntPow.text = "Power \(nightHunterPow)"
        
      
    }

}
