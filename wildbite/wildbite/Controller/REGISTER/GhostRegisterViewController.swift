//
//  GhostRegisterViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 13.04.2023.
//

import UIKit

class GhostRegisterViewController: UIViewController {

    
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
        
        powerProgress.progress = 0.5
        defProgress.progress = 0.2
        speedProgress.progress = 1.0
        smartProgress.progress = 0.3
        
        powValueLabel.text = "5"
        defValueLabel.text = "2"
        speedValueLabel.text = "10"
        smartValueLabel.text = "3"
        
      
    }
    

    

}
