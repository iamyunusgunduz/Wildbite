//
//  SettingsViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 5.04.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var AdminPanelButtonText: UIButton!
    let myUserRole = UserDefaults.standard.value(forKey: "userRole")
    override func viewDidLoad() {
        super.viewDidLoad()

        if(myUserRole as! String == "0"){
            AdminPanelButtonText.isHidden = false
        }
    }
    

   
    @IBAction func AdminPanelButton(_ sender: Any) {
    }
    
}
