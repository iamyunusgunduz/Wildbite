//
//  HuntViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 7.04.2023.
//

import UIKit
import Alamofire

class HuntViewController: UIViewController {
    
    @IBOutlet weak var easyButton: UIButton!
    @IBOutlet weak var mediumButton: UIButton!
    @IBOutlet weak var hardButton: UIButton!
    @IBOutlet weak var veryHardButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func easyHunt(_ sender: Any) {
        UserDefaults.standard.set(5, forKey: "HuntType")
        performSegue(withIdentifier: "huntToCase", sender: nil)
    }
    
    
    @IBAction func mediumHunt(_ sender: Any) {
        UserDefaults.standard.set(10, forKey: "HuntType")
        performSegue(withIdentifier: "huntToCase", sender: nil)
    }
    
    @IBAction func hardHunt(_ sender: Any) {
        UserDefaults.standard.set(20, forKey: "HuntType")
        performSegue(withIdentifier: "huntToCase", sender: nil)
    }
    
    
    @IBAction func veryHardHunt(_ sender: Any) {
        UserDefaults.standard.set(30, forKey: "HuntType")
        performSegue(withIdentifier: "huntToCase", sender: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        loadPage()
    }
    fileprivate func loadPage() {
        
        
        let huntType = UserDefaults.standard.value(forKey: "HuntType") as? Int
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
                            let userEnerji = Int(profileModelresponse!.user.currentEnergy)!
                            if(userEnerji < 5 ) {
                                easyButton.isEnabled = false
                            }else{
                                easyButton.isEnabled = true
                            }
                            if(userEnerji < 10) {
                                mediumButton.isEnabled = false
                            }else{
                                mediumButton.isEnabled = true
                            }
                            if(userEnerji < 20 ) {
                                hardButton.isEnabled = false
                            } else{
                                hardButton.isEnabled = true
                            }
                            
                            if(userEnerji < 30 ) {
                                veryHardButton.isEnabled = false
                            }else {
                                veryHardButton.isEnabled = true
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
        
    }
}
