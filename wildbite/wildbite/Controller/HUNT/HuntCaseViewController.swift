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
    
    fileprivate func loadPage() {
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
            AF.request("http://backhub.site/wildbite/public/api/user/\(myUserID!))" , headers: headers )
                .validate(statusCode: 200..<500)
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
                            
                            let userEnerji = Int(profileModelresponse!.user.currentEnergy)!
                            if(userEnerji < 10 && huntType == 5) {
                                HuntingButtonLabel.isEnabled = false
                                userEnergy.text = "0"
                            }
                            if(userEnerji < 20 && huntType == 10 ) {
                                HuntingButtonLabel.isEnabled = false
                                userEnergy.text = "0"
                            }
                            if(userEnerji < 40 && huntType == 20) {
                                HuntingButtonLabel.isEnabled = false
                                userEnergy.text = "0"
                            }
                            
                            if(userEnerji < 60 && huntType == 30 ) {
                                HuntingButtonLabel.isEnabled = false
                                userEnergy.text = "0"
                            }
                            
                            
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
    
    override func viewWillAppear(_ animated: Bool) {
        loadPage()
        }
    
    
    
    @IBAction func huntingButton(_ sender: Any) {
       
        prizeGold.isHidden = true
        prizeExp.isHidden = true
        prizeHealth.isHidden = true
        prizeLabel.isHidden = true
        
        myActivityIndicator.startAnimating()
        HuntingButtonLabel.backgroundColor = UIColor.systemGray
        HuntingButtonLabel.titleLabel?.text = "HUNTING"
        viewWillAppear(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2)
        { [self] in
           
            
          
            myActivityIndicator.stopAnimating()
            HuntingButtonLabel.backgroundColor = UIColor.systemPink
            HuntingButtonLabel.titleLabel?.text = "HUNT"
           
                let huntType = UserDefaults.standard.value(forKey: "HuntType") as! Int
                let randomNumber = Int.random(in: 1...10)
            
                switch huntType{
                    
                case 5:
                    print("Debug Random Number : \(randomNumber)")
                 
                        // MARK: Api start
                        let usertoken = UserDefaults.standard.string(forKey: "userToken")
                        let headers: HTTPHeaders = [
                            .authorization(bearerToken: usertoken!),
                            .accept("application/json")
                        ]
                   var huntParameters:WarModelYapi
                        if(randomNumber < 9){
                            prizeGold.text = "GOLD +10"
                            prizeExp.text = "EXP +5"
                            prizeHealth.text = "HEALTH + 15"
                            prizeLabel.text = "ENERGY -5"
                            huntParameters = WarModelYapi(exp:5, gold: 10, current_health: 15, maximum_health: 0, current_energy: -5, maximum_energy: 0, level: 0, war_total: 0, war_total_win: 0, war_total_lose: 0, war_total_gold: 0)
                        }else{
                            prizeGold.text = ""
                            prizeExp.text = ""
                            prizeHealth.text = ""
                            prizeLabel.text = "ENERGY -5"
                           huntParameters = WarModelYapi(exp:0, gold: 0, current_health: 0, maximum_health: 0, current_energy: -5, maximum_energy: 0, level: 0, war_total: 0, war_total_win: 0, war_total_lose: 0, war_total_gold: 0)
                        }
                      AF.request("http://backhub.site/wildbite/public/api/war",
                                 method: .put,
                                 parameters: huntParameters,
                                 headers: headers)
                      .validate(statusCode: 200..<500)
                      .validate(contentType: ["application/json"])
                      .responseData {      response in
                          debugPrint(response)
                          switch response.result {
                          case .success:
                                  let huntResponse = try? JSONDecoder().decode(WarModel.self,  from: response.data!)
                                  debugPrint(huntResponse ?? "huntResponse bisey oldu")
                                 
                                 
                          case let .failure(error):
                              print(error.errorDescription!)
                              print("hata")
                          }
                      }
                        // MARK: Api end
                  
                      
                   
                  
                    
                    // kazanma gold + 20   exp +10   can +30    enerji -10
                    // kaybetme enerji -10
                        // random < 7
                case 10:
                        print("Debug Random Number : \(randomNumber)")
                        // MARK: Api start
                        let usertoken = UserDefaults.standard.string(forKey: "userToken")
                        let headers: HTTPHeaders = [
                            .authorization(bearerToken: usertoken!),
                            .accept("application/json")
                        ]
                   var huntParameters:WarModelYapi
                        if(randomNumber < 7){
                            prizeGold.text = "GOLD +20"
                            prizeExp.text = "EXP +10"
                            prizeHealth.text = "HEALTH + 30"
                            prizeLabel.text = "ENERGY -10"
                            huntParameters = WarModelYapi(exp:10, gold: 20, current_health: 30, maximum_health: 0, current_energy: -10, maximum_energy: 0, level: 0, war_total: 0, war_total_win: 0, war_total_lose: 0, war_total_gold: 0)
                        }else{
                            prizeGold.text = ""
                            prizeExp.text = ""
                            prizeHealth.text = ""
                            prizeLabel.text = "ENERGY -10"
                           huntParameters = WarModelYapi(exp:0, gold: 0, current_health: 0, maximum_health: 0, current_energy: -10, maximum_energy: 0, level: 0, war_total: 0, war_total_win: 0, war_total_lose: 0, war_total_gold: 0)
                        }
                      AF.request("http://backhub.site/wildbite/public/api/war",
                                 method: .put,
                                 parameters: huntParameters,
                                 headers: headers)
                      .validate(statusCode: 200..<500)
                      .validate(contentType: ["application/json"])
                      .responseData {      response in
                          debugPrint(response)
                          switch response.result {
                          case .success:
                                  let huntResponse = try? JSONDecoder().decode(WarModel.self,  from: response.data!)
                                  debugPrint(huntResponse ?? "huntResponse bisey oldu")
                                 
                                 
                          case let .failure(error):
                              print(error.errorDescription!)
                              print("hata")
                          }
                      }
                        // MARK: Api end
            
                        // kazanma gold + 40   exp + 20   can +60    enerji -20
                            // random < 5
                case 20:
                        print("Debug Random Number : \(randomNumber)")
                        // MARK: Api start
                        let usertoken = UserDefaults.standard.string(forKey: "userToken")
                        let headers: HTTPHeaders = [
                            .authorization(bearerToken: usertoken!),
                            .accept("application/json")
                        ]
                   var huntParameters:WarModelYapi
                        if(randomNumber < 5){
                            prizeGold.text = "GOLD +40"
                            prizeExp.text = "EXP +20"
                            prizeHealth.text = "HEALTH + 60"
                            prizeLabel.text = "ENERGY -20"
                            huntParameters = WarModelYapi(exp:20, gold: 40, current_health: 60, maximum_health: 0, current_energy: -20, maximum_energy: 0, level: 0, war_total: 0, war_total_win: 0, war_total_lose: 0, war_total_gold: 0)
                        }else{
                            prizeGold.text = ""
                            prizeExp.text = ""
                            prizeHealth.text = ""
                            prizeLabel.text = "ENERGY -20"
                           huntParameters = WarModelYapi(exp:0, gold: 0, current_health: 0, maximum_health: 0, current_energy: -20, maximum_energy: 0, level: 0, war_total: 0, war_total_win: 0, war_total_lose: 0, war_total_gold: 0)
                        }
                      AF.request("http://backhub.site/wildbite/public/api/war",
                                 method: .put,
                                 parameters: huntParameters,
                                 headers: headers)
                      .validate(statusCode: 200..<500)
                      .validate(contentType: ["application/json"])
                      .responseData {      response in
                          debugPrint(response)
                          switch response.result {
                          case .success:
                                  let huntResponse = try? JSONDecoder().decode(WarModel.self,  from: response.data!)
                                  debugPrint(huntResponse ?? "huntResponse bisey oldu")
                                 
                                 
                          case let .failure(error):
                              print(error.errorDescription!)
                              print("hata")
                          }
                      }
                        // MARK: Api end
                        
                        // kazanma gold + 60   exp + 30   can +90    enerji -30
                            // random < 3
                case 30:
                    print("Debug Random Number : \(randomNumber)")
               
                        // MARK: Api start
                        let usertoken = UserDefaults.standard.string(forKey: "userToken")
                        let headers: HTTPHeaders = [
                            .authorization(bearerToken: usertoken!),
                            .accept("application/json")
                        ]
                   var huntParameters:WarModelYapi
                        if(randomNumber < 5){
                            prizeGold.text = "GOLD +60"
                            prizeExp.text = "EXP +30"
                            prizeHealth.text = "HEALTH + 90"
                            prizeLabel.text = "ENERGY -30"
                            huntParameters = WarModelYapi(exp:30, gold: 60, current_health: 90, maximum_health: 0, current_energy: -30, maximum_energy: 0, level: 0, war_total: 0, war_total_win: 0, war_total_lose: 0, war_total_gold: 0)
                        }else{
                            prizeGold.text = ""
                            prizeExp.text = ""
                            prizeHealth.text = ""
                            prizeLabel.text = "ENERGY -30"
                           huntParameters = WarModelYapi(exp:0, gold: 0, current_health: 0, maximum_health: 0, current_energy: -30, maximum_energy: 0, level: 0, war_total: 0, war_total_win: 0, war_total_lose: 0, war_total_gold: 0)
                        }
                      AF.request("http://backhub.site/wildbite/public/api/war",
                                 method: .put,
                                 parameters: huntParameters,
                                 headers: headers)
                      .validate(statusCode: 200..<500)
                      .validate(contentType: ["application/json"])
                      .responseData {      response in
                          debugPrint(response)
                          switch response.result {
                          case .success:
                                  let huntResponse = try? JSONDecoder().decode(WarModel.self,  from: response.data!)
                                  debugPrint(huntResponse ?? "huntResponse bisey oldu")
                                 
                                 
                          case let .failure(error):
                              print(error.errorDescription!)
                              print("hata")
                          }
                      }
                        // MARK: Api end
                   
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
    



