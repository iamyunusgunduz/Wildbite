//
//  WildRegisterViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 13.04.2023.
//

import UIKit

class WITCHRegisterViewController: UIViewController {

    
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
        powerProgress.progress = 0.3
        defProgress.progress = 1.0
        speedProgress.progress = 0.2
        smartProgress.progress = 0.5
        
        powValueLabel.text = "3"
        defValueLabel.text = "10"
        speedValueLabel.text = "2"
        smartValueLabel.text = "5"
        
      
    }
    

    

}
