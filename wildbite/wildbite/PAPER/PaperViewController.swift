//
//  PaperViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 9.04.2023.
//

import UIKit
import PaperOnboarding

class PaperViewController: UIViewController,PaperOnboardingDataSource,PaperOnboardingDelegate {
   var secilenKarakter = "HUNTER"
    func onboardingItem(at index: Int) -> OnboardingItemInfo {

        let titleFont = UIFont(name: "Nunito-Bold", size: 36.0) ?? UIFont.boldSystemFont(ofSize: 36.0)
        let descriptionFont = UIFont(name: "OpenSans-Regular", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
        
       return [
        OnboardingItemInfo(informationImage: UIImage(named: "homeLight")!,
                                       title: "HUNTER",
                                 description: "He is the person who hunted wolves and vampires ",
                                    pageIcon: UIImage(named: "homeLight")!,
                         //  color: UIColor(red: 0.40, green: 0.56, blue: 0.71, alpha: 1.00),
                           color: UIColor.black,
                                                    titleColor: UIColor.systemRed, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
        
        
         OnboardingItemInfo(informationImage: UIImage(named: "profileLight")!,
                                        title: "WEREWOLF",
                                  description: "Human Wolves of Wild Nature",
                                     pageIcon: UIImage(named: "profileLight")!,
                            //color: UIColor(red: 0.40, green: 0.69, blue: 0.71, alpha: 1.00),
                            color: UIColor.black,
                                                      titleColor: UIColor.systemRed, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont),
                                   

        OnboardingItemInfo(informationImage: UIImage(named: "settingsLight")!,
                                     title: "VAMPIRE",
                               description: "Creature for blood",
                                  pageIcon: UIImage(named: "settingsLight")!,
                           // color: UIColor(red: 0.61, green: 0.56, blue: 0.74, alpha: 1.00),
                           color: UIColor.black,
                                                     titleColor: UIColor.systemRed, descriptionColor: UIColor.white, titleFont: titleFont, descriptionFont: descriptionFont)
         ][index]
     }

     func onboardingItemsCount() -> Int {
        return 3
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
                secilenKarakter = "HUNTER"
                print("Debug secilen karakter: \(secilenKarakter)")
            }
            
        }
        if(index == 1){
            UIView.animate(withDuration: 0.9) { [self] in
                print("Debug: Index 1")
                secilenKarakter = "WEREWOLF"
                print("Debug secilen karakter: \(secilenKarakter)")
            }
        }
            if(index == 2){
                UIView.animate(withDuration: 0.9) { [self] in
                    secilenKarakter = "VAMPIRE"
                    print("Debug secilen karakter: \(secilenKarakter)")
                    print("Debug: Index 2")
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
    }
   

}

