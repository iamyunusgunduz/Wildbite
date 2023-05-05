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
        
    }
    

}
