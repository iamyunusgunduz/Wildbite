//
//  WiseRegisterViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 13.04.2023.
//

import UIKit

class WiseRegisterViewController: UIViewController {

    
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
        
        powerProgress.progress = 0.2
        defProgress.progress = 0.5
        speedProgress.progress = 0.3
        smartProgress.progress = 1.0
        
        powValueLabel.text = "2"
        defValueLabel.text = "5"
        speedValueLabel.text = "3"
        smartValueLabel.text = "10"
        
      
    }
    

    

}
