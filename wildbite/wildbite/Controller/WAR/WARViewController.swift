//
//  WARViewController.swift
//  wildbite
//
//  Created by Yunus Gündüz on 5.05.2023.
//

import UIKit

class WARViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func randomWarButton(_ sender: Any) {
        performSegue(withIdentifier: "warToChosenPage", sender: nil)
        let random = Int.random(in: 0...3)
        
        UserDefaults.standard.set(random, forKey: "choosenWartype")
        UserDefaults.standard.set("random", forKey: "choosenWarNumber")
    }
    
    
    @IBAction func vampireWarButton(_ sender: Any) {
        performSegue(withIdentifier: "warToChosenPage", sender: nil)
        UserDefaults.standard.set(2, forKey: "choosenWartype")
        UserDefaults.standard.set("2", forKey: "choosenWarNumber")
    }
    
    @IBAction func werewolfWarButton(_ sender: Any) {
        performSegue(withIdentifier: "warToChosenPage", sender: nil)
        UserDefaults.standard.set(1, forKey: "choosenWartype")
        UserDefaults.standard.set("1", forKey: "choosenWarNumber")
    }
    
    @IBAction func hunterWarButton(_ sender: Any) {
        performSegue(withIdentifier: "warToChosenPage", sender: nil)
        UserDefaults.standard.set(0, forKey: "choosenWartype")
        UserDefaults.standard.set("0", forKey: "choosenWarNumber")
    }
    
    @IBAction func WitchWarButton(_ sender: Any) {
        performSegue(withIdentifier: "warToChosenPage", sender: nil)
        UserDefaults.standard.set(3, forKey: "choosenWartype")
        UserDefaults.standard.set("3", forKey: "choosenWarNumber")
    }
    

}
