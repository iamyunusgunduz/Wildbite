//
//  ChosenWarTypeViewController.swift
//  wildbite
//
//  Created by Yunus Gündüz on 6.05.2023.
//

import UIKit
import Alamofire
import Kingfisher


 

class ChosenWarTypeViewController: UIViewController {

    
    
    @IBOutlet weak var enemynameLabel: UILabel!
    @IBOutlet weak var enemyRole: UILabel!
    @IBOutlet weak var enemyLevel: UILabel!
    @IBOutlet weak var enemyDamage: UILabel!
    @IBOutlet weak var enemyPower: UILabel!
    @IBOutlet weak var enemyDefance: UILabel!
    @IBOutlet weak var enemySpeed: UILabel!
    @IBOutlet weak var enemyHealth: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         
    }
    
    fileprivate func loadWarProfileEnemy() {
        let myUserID = UserDefaults.standard.value(forKey: "userID")
        
        let myUserToken = UserDefaults.standard.value(forKey: "userToken")
        let myChoosenWartype = UserDefaults.standard.value(forKey: "choosenWartype")
        print("User Id: \(myUserID!)")
        
        print("User Token: \(myUserToken!)")
        print("User myChoosenWartype: \(myChoosenWartype!)")
        
        let token = "\(myUserToken!)"
        
        let headers: HTTPHeaders = [
            
            .authorization(bearerToken: token),
            .accept("application/json")
            
        ]
        
        
        
        AF.request("http://yunusgunduz.site/wildbite/public/api/random-race-user?race=\(myChoosenWartype!))" , headers: headers )
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { [self]  response in
                debugPrint(response)
                
                switch response.result {
                case .success:
                    print("Validation Successful")
                    
                    let chosenWar = try? JSONDecoder().decode(ChosenWar.self, from: response.data!)
                    
                    
                    
                    
                    dump(chosenWar)
                   
                    if(chosenWar == nil){
                        loadWarProfileEnemy()
                    }else{
                        
                        if let enemyID = chosenWar?.user.id{
                            if(myUserID as! Int == enemyID){
                                loadWarProfileEnemy()
                            }
                         
                        }
                        if let enemyName = chosenWar?.user.name{
                            
                            enemynameLabel.text = "Name: \(enemyName)"
                        }
                        
                    }
                   
                    
                    
                case let .failure(err):
                    print("Hata oldi")
                    print(err.errorDescription!)
                }
                
            }
    }
    @IBAction func againChooseButton(_ sender: Any) {
        let random = Int.random(in: 0...3)
        
        UserDefaults.standard.set(random, forKey: "choosenWartype")
        loadWarProfileEnemy()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadWarProfileEnemy()
            }
    }
   
    


