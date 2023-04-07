//
//  HuntViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 7.04.2023.
//

import UIKit

class HuntViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func easyHunt(_ sender: Any) {
        UserDefaults.standard.set(5, forKey: "HuntType")
        performSegue(withIdentifier: "huntToCase", sender: nil)
    }
   
    
    @IBAction func mediumHunt(_ sender: Any) {
        UserDefaults.standard.set(10, forKey: "HuntType")
        performSegue(withIdentifier: "huntToCase", sender: nil)
    }
    
    @IBAction func hardHunt(_ sender: Any) {
        UserDefaults.standard.set(20, forKey: "HuntType")
        performSegue(withIdentifier: "huntToCase", sender: nil)
    }
    
    
    @IBAction func veryHardHunt(_ sender: Any) {
        UserDefaults.standard.set(30, forKey: "HuntType")
        performSegue(withIdentifier: "huntToCase", sender: nil)
    }
    
    
    
}
