//
//  WildRegisterViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 13.04.2023.
//

import UIKit

class WildRegisterViewController: UIViewController {

    
    @IBOutlet weak var powerProgress: UIProgressView!
    
    @IBOutlet weak var defProgress: UIProgressView!
    
    
    @IBOutlet weak var speedProgress: UIProgressView!
    
    @IBOutlet weak var smartProgress: UIProgressView!
    
    @IBOutlet weak var powValueLabel: UILabel!
    @IBOutlet weak var defValueLabel: UILabel!
    @IBOutlet weak var speedValueLabel: UILabel!
    @IBOutlet weak var smartValueLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        powerProgress.progress = 1.0
        defProgress.progress = 0.3
        speedProgress.progress = 0.5
        smartProgress.progress = 0.2
        
        powValueLabel.text = "10"
        defValueLabel.text = "3"
        speedValueLabel.text = "5"
        smartValueLabel.text = "2"
        
      
    }
    

    

}
