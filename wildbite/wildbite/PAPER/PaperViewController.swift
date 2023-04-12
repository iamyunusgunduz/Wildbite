//
//  PaperViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 9.04.2023.
//

import UIKit
import PaperOnboarding

class PaperViewController: UIViewController,PaperOnboardingDataSource,PaperOnboardingDelegate {
   var secilenKarakter = "WISE"
    
    @IBOutlet weak var powerProgress: UIProgressView!
    
    @IBOutlet weak var defProgress: UIProgressView!
    
    
    @IBOutlet weak var speedProgress: UIProgressView!
    
    @IBOutlet weak var smartProgress: UIProgressView!
    
    @IBOutlet weak var powValueLabel: UILabel!
    @IBOutlet weak var defValueLabel: UILabel!
    @IBOutlet weak var speedValueLabel: UILabel!
    @IBOutlet weak var smartValueLabel: UILabel!
    
    
    
    
    
    
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {

        let titleFont = UIFont(name: "Nunito-Bold", size: 36.0) ?? UIFont.boldSystemFont(ofSize: 36.0)
        let descriptionFont = UIFont(name: "OpenSans-Regular", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
        
       return [
        OnboardingItemInfo(informationImage: UIImage(named: "homeLight")!,
                                       title: "WISE",
                                 description: "More than Smart ",
                                    pageIcon: UIImage(named: "homeLight")!,
                         //  color: UIColor(red: 0.40, green: 0.56, blue: 0.71, alpha: 1.00),
                           color: UIColor.black,
                                                    titleColor: UIColor.systemRed, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        
         OnboardingItemInfo(informationImage: UIImage(named: "profileLight")!,
                                        title: "GHOST",
                                  description: "Human Wolves of Wild Nature",
                                     pageIcon: UIImage(named: "profileLight")!,
                            //color: UIColor(red: 0.40, green: 0.69, blue: 0.71, alpha: 1.00),
                            color: UIColor.black,
                                                      titleColor: UIColor.systemRed, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
                                   
        OnboardingItemInfo(informationImage: UIImage(named: "profileLight")!,
                                       title: "GUARDIAN",
                                 description: "Human Wolves of Wild Nature",
                                    pageIcon: UIImage(named: "profileLight")!,
                           //color: UIColor(red: 0.40, green: 0.69, blue: 0.71, alpha: 1.00),
                           color: UIColor.black,
                                                     titleColor: UIColor.systemRed, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
                                  
        OnboardingItemInfo(informationImage: UIImage(named: "settingsLight")!,
                                     title: "WILD",
                               description: "Creature for blood",
                                  pageIcon: UIImage(named: "settingsLight")!,
                           // color: UIColor(red: 0.61, green: 0.56, blue: 0.74, alpha: 1.00),
                           color: UIColor.black,
                                                     titleColor: UIColor.systemRed, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont)
         ][index]
     }

     func onboardingItemsCount() -> Int {
        return 4
      }
    func onboardingDidTransitonToIndex(_ index: Int) {
        print("Debug: didTransition")
    }
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        print("Debug: Configuration")
    }
    func onboardingWillTransitonToLeaving() {
        print("Debug: leaving")
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if(index == 0){
            UIView.animate(withDuration: 0.1) { [self] in
                print("Debug: Index 0")
                secilenKarakter = "WISE"
                print("Debug secilen karakter: \(secilenKarakter)")
                
                
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
        if(index == 1){
            UIView.animate(withDuration: 0.9) { [self] in
                print("Debug: Index 1")
                secilenKarakter = "GHOST"
                print("Debug secilen karakter: \(secilenKarakter)")
                
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
            if(index == 2){
                UIView.animate(withDuration: 0.9) { [self] in
                    secilenKarakter = "GUARDIAN"
                    print("Debug secilen karakter: \(secilenKarakter)")
                    print("Debug: Index 2")
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
          
        
        if(index == 3) {
            UIView.animate(withDuration: 0.9) { [self] in
                secilenKarakter = "WILD"
                print("Debug secilen karakter: \(secilenKarakter)")
                print("Debug: Index 3")
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
    }
    
    
    @IBAction func characterSelectButton(_ sender: Any) {
    print("----- Secilen karakter \(secilenKarakter)")
      
        
        let alert = UIAlertController(title: "Choosen character : \(secilenKarakter)", message: "Are you sure ?", preferredStyle: .alert)
               let okButton = UIAlertAction(title: "Ok", style: .default) { (action) in
                   print("ok was clicked")
               }
        
       
     

     
               let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                   print("cancel was clicked")
              }
               alert.addAction(okButton)
               alert.addAction(cancelButton)
               present(alert, animated: true) {
                   print("alert is done")
               }
        
        
    }
    
    @IBOutlet weak var onboardingTwoView: myOnBoardign!
    override func viewDidLoad() {
     
        super.viewDidLoad()
        onboardingTwoView.delegate = self
        onboardingTwoView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Debug secilen karakter: \(secilenKarakter)")
        powerProgress.progress = 0.2
        defProgress.progress = 0.5
        speedProgress.progress = 0.3
        smartProgress.progress = 1
        
        powValueLabel.text = "2"
        defValueLabel.text = "5"
        speedValueLabel.text = "3"
        smartValueLabel.text = "10"
    }
   

}

