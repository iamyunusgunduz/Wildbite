//
//  HuntCaseViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 7.04.2023.
//

import UIKit
import Alamofire

class HuntCaseViewController: UIViewController {

    @IBOutlet weak var userGold: UILabel!
    
    @IBOutlet weak var userEnergy: UILabel!
    
    @IBOutlet weak var userHealth: UILabel!
   
    
    @IBOutlet weak var HuntingButtonLabel: UIButton!
    
    @IBOutlet weak var reqHealth: UILabel!
    
    @IBOutlet weak var reqEnergy: UILabel!
    
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var prizeGold: UILabel!
    
    
    @IBOutlet weak var prizeExp: UILabel!
    
    
    @IBOutlet weak var prizeHealth: UILabel!
    
    
    @IBOutlet weak var prizeLabel: UILabel!
    
    @IBOutlet weak var myNavigationItem: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        prizeGold.isHidden = true
        prizeExp.isHidden = true
        prizeHealth.isHidden = true
        prizeLabel.isHidden = true
        
        let huntType = UserDefaults.standard.value(forKey: "HuntType") as! Int
        let myUserID = UserDefaults.standard.value(forKey: "userID")
        let myUserToken = UserDefaults.standard.value(forKey: "userToken")
        print("User Id: \(myUserID!)")
        print("User Token: \(myUserToken!)")
        
        let token = "\(myUserToken!)"
        
        let headers: HTTPHeaders = [
        
            .authorization(bearerToken: token),
            .accept("application/json")
            
        ]
        
        DispatchQueue.main.async {
            AF.request("http://yunusgunduz.site/wildbite/public/api/user/\(myUserID!))" , headers: headers )
                .validate(statusCode: 200..<300)
                .validate(contentType: ["application/json"])
                .responseData { [self]  response in
                    
                    
                    switch response.result {
                    case .success:
                        print("Validation Successful")
                        
                        let profileModelresponse = try? JSONDecoder().decode(ProfileModel.self, from: response.data!)
                        debugPrint(profileModelresponse!)
                        
                        print(profileModelresponse!.user.name)
                        print("USER GOLD: \(profileModelresponse!.user.gold)")
                        print("USER ENERGY: \(profileModelresponse!.user.currentEnergy)")
                        print("USER HEALTH: \(profileModelresponse!.user.currentHealth)")
                        
                        userGold.text = " GOLD: \(profileModelresponse!.user.gold)"
                        userEnergy.text = " ENERGY: \(profileModelresponse!.user.currentEnergy)"
                        userHealth.text = " HEALTH: \(profileModelresponse!.user.currentHealth)"
                        
                      
          
                        
                        profileModelresponse!.item.forEach { Item in
                            print("Item Name: \(Item.name) Level")
                            print(Item.name)

                        }
                        
                        
                        
                    case let .failure(error):
                        print(error.errorDescription!)
                        print("hata")
                    }
                }
        }
        
        
        print("\(String(describing: huntType))")
        switch huntType{
        case 5:
            myNavigationItem.title = "EASY HUNTING"
            reqEnergy.text = "ENERGY -5"
            reqHealth.text = "HEALTH -20"
        case 10:
            myNavigationItem.title = "MEDIUM HUNTING"
            reqEnergy.text = "ENERGY -10"
            reqHealth.text = "HEALTH -40"
        case 20:
            myNavigationItem.title = "HARD HUNTING"
            reqEnergy.text = "ENERGY -20"
            reqHealth.text = "HEALTH -80"
        case 30:
            myNavigationItem.title = "VERY HARD HUNTING"
            reqEnergy.text = "ENERGY -30"
            reqHealth.text = "HEALTH -120"
        default:
            myNavigationItem.title = "HUNTING CASE"
            reqEnergy.text = "ENERGY -0"
        }
        }
    
    
    
    @IBAction func huntingButton(_ sender: Any) {
        prizeGold.isHidden = true
        prizeExp.isHidden = true
        prizeHealth.isHidden = true
        prizeLabel.isHidden = true
        HuntingButtonLabel.isEnabled = false
        myActivityIndicator.startAnimating()
        HuntingButtonLabel.backgroundColor = UIColor.systemGray
        HuntingButtonLabel.titleLabel?.text = "HUNTING"
        DispatchQueue.main.asyncAfter(deadline: .now() + 3)
        { [self] in
           
            
           
                myActivityIndicator.stopAnimating()
            HuntingButtonLabel.backgroundColor = UIColor.systemPink
            HuntingButtonLabel.titleLabel?.text = "HUNT"
            HuntingButtonLabel.isEnabled = true
                let huntType = UserDefaults.standard.value(forKey: "HuntType") as! Int
                let randomNumber = Int.random(in: 1...10)
            
                switch huntType{
                    
                case 5:
                    print("Debug Random Number : \(randomNumber)")
                    if(randomNumber < 9){
                        prizeGold.text = "GOLD +10"
                        prizeExp.text = "EXP +5"
                        prizeHealth.text = "HEALTH + 15"
                        prizeLabel.text = "ENERGY -5"
                    }else {
                        prizeGold.text = ""
                        prizeExp.text = ""
                        prizeHealth.text = ""
                        prizeLabel.text = "ENERGY -5"
                        break
                    }
                    
                    
                case 10:
                    print("Debug Random Number : \(randomNumber)")
                    if(randomNumber < 7){
                        prizeGold.text = "GOLD +20"
                        prizeExp.text = "EXP +10"
                        prizeHealth.text = "HEALTH + 30"
                        prizeLabel.text = "ENERGY -10"
                }else {
                    prizeGold.text = ""
                    prizeExp.text = ""
                    prizeHealth.text = ""
                    prizeLabel.text = "ENERGY -10"
                    break
                }
            
            
                case 20:
                    print("Debug Random Number : \(randomNumber)")
                    
                    if(randomNumber < 5){
                        prizeGold.text = "GOLD +40"
                        prizeExp.text = "EXP +20"
                        prizeHealth.text = "HEALTH + 60"
                        prizeLabel.text = "ENERGY -20"
                }else {
                    prizeGold.text = ""
                    prizeExp.text = ""
                    prizeHealth.text = ""
                    prizeLabel.text = "ENERGY -20"
                    break
                }
                    
                case 30:
                    print("Debug Random Number : \(randomNumber)")
               
                    if(randomNumber < 3){
                        prizeGold.text = "GOLD +60"
                        prizeExp.text = "EXP +30"
                        prizeHealth.text = "HEALTH + 90"
                        prizeLabel.text = "ENERGY -30"
                }else {
                    prizeGold.text = ""
                    prizeExp.text = ""
                    prizeHealth.text = ""
                    prizeLabel.text = "ENERGY -30"
                    break
                }
                    
                   
                default:
                    print("Debug Random Number : \(randomNumber)")
                    prizeGold.text = "GOLD +0"
                    prizeExp.text = "EXP +0"
                    prizeHealth.text = "HEALTH + 0"
                }
                
                prizeGold.isHidden = false
                prizeExp.isHidden = false
                prizeHealth.isHidden = false
                prizeLabel.isHidden = false

            }
       
       
            }
    
    }
    



