//
//  PaperViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 9.04.2023.
//

import UIKit
import PaperOnboarding

class PaperViewController: UIViewController,PaperOnboardingDataSource {
    func onboardingItem(at index: Int) -> OnboardingItemInfo {

        let titleFont = UIFont(name: "Nunito-Bold", size: 36.0) ?? UIFont.boldSystemFont(ofSize: 36.0)
        let descriptionFont = UIFont(name: "OpenSans-Regular", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
        
       return [
        OnboardingItemInfo(informationImage: UIImage(named: "homeLight")!,
                                       title: "title",
                                 description: "description",
                                    pageIcon: UIImage(named: "homeLight")!,
                         //  color: UIColor(red: 0.40, green: 0.56, blue: 0.71, alpha: 1.00),
                           color: UIColor.black,
                                                    titleColor: UIColor.systemRed, descriptionColor: UIColor.systemRed, titleFont: titleFont, descriptionFont: descriptionFont),
        
        
         OnboardingItemInfo(informationImage: UIImage(named: "profileLight")!,
                                        title: "title",
                                  description: "description",
                                     pageIcon: UIImage(named: "profileLight")!,
                            //color: UIColor(red: 0.40, green: 0.69, blue: 0.71, alpha: 1.00),
                            color: UIColor.systemRed,
                                                      titleColor: UIColor.black, descriptionColor: UIColor.black, titleFont: titleFont, descriptionFont: descriptionFont),
                                   

        OnboardingItemInfo(informationImage: UIImage(named: "settingsLight")!,
                                     title: "title",
                               description: "description",
                                  pageIcon: UIImage(named: "settingsLight")!,
                           // color: UIColor(red: 0.61, green: 0.56, blue: 0.74, alpha: 1.00),
                           color: UIColor.black,
                                                     titleColor: UIColor.systemRed, descriptionColor: UIColor.systemRed, titleFont: titleFont, descriptionFont: descriptionFont)
         ][index]
     }

     func onboardingItemsCount() -> Int {
        return 3
      }
    
    @IBOutlet weak var onboardingTwoView: myOnBoardign!
    override func viewDidLoad() {
        super.viewDidLoad()

        onboardingTwoView.dataSource = self
    }
    

   

}

