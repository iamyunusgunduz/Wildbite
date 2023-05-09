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
    
    @IBOutlet weak var enemyProfileImage: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

         
    }
    
    fileprivate func loadWarProfileEnemy() {
        let myUserID = UserDefaults.standard.value(forKey: "userID")
        
        let myUserToken = UserDefaults.standard.value(forKey: "userToken")
        let myChoosenWartype = UserDefaults.standard.value(forKey: "choosenWartype") as! Int
        print("User Id: \(myUserID!)")
        
        print("User Token: \(myUserToken!)")
        print("User myChoosenWartype: \(myChoosenWartype)")
        
        let token = "\(myUserToken!)"
        
        let headers: HTTPHeaders = [
            
            .authorization(bearerToken: token),
            .accept("application/json")
            
        ]
        
        
        
        AF.request("http://yunusgunduz.site/wildbite/public/api/random-race-user?race=\(myChoosenWartype))" , headers: headers )
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
                        // enemy name
                        if let enemyNamem = chosenWar?.user.name{
                            
                            enemynameLabel.text = "Name: \(enemyNamem)"
                        }
                        // enemy Type
                        
                            switch myChoosenWartype {
                                case 0:
                                    enemyRole.text = "Role: HUNTER "
                                case 1:
                                    enemyRole.text = "Role: WEREWOLF "
                                case 2:
                                    enemyRole.text = "Role: VAMPIRE "
                                case 3:
                                    enemyRole.text = "Role: WITCH "
                                default:
                                    enemyRole.text = "-"
                            }
                           
                        
                        // enemy level
                        if let enemyLevelm = chosenWar?.user.level{
                            
                            enemyLevel.text = "Level: \(enemyLevelm)"
                        }
                        //enemy Damage
                        if let enemyDamagem = chosenWar?.user.totalDamage{
                            
                            enemyDamage.text = "Damage: \(enemyDamagem)"
                        }
                        
                        //enemy Power
                        if let enemyPowerm = chosenWar?.user.power{
                            
                            enemyPower.text = "Power: \(enemyPowerm)"
                        }
                        
                        //enemy Defence
                        if let enemyDefensem = chosenWar?.user.defense{
                            
                            enemyDefance.text = "Defense: \(enemyDefensem)"
                        }
                        
                        //enemy Speed
                        if let enemySpeedm = chosenWar?.user.speed{
                            
                            enemySpeed.text = "Speed: \(enemySpeedm)"
                        }
                        
                        //enemy Health
                        if let enemyHealthm = chosenWar?.user.maximumHealth{
                            
                            enemyHealth.text = "Health: \(enemyHealthm)"
                        }
                        //enemy Health
                        if let enemyimagem = chosenWar?.user.image{
                            
                            let url = URL(string: "\(enemyimagem)")
                            DispatchQueue.main.async{ [self] in
                                enemyProfileImage.kf.setImage(with: url)
                            }
                           
                            
                             
                        }
                        
                        
                        
                    }
                   
                    
                    
                case let .failure(err):
                    print("Hata oldi")
                    print(err.errorDescription!)
                }
                
            }
    }
    @IBAction func againChooseButton(_ sender: Any) {
        
        let myChoosenNumber = UserDefaults.standard.value(forKey: "choosenWarNumber")
        if(myChoosenNumber as! String == "random" ){
            let random = Int.random(in: 0...3)
            
            UserDefaults.standard.set(random, forKey: "choosenWartype")
        }
        
      
       
        loadWarProfileEnemy()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadWarProfileEnemy()
            }
    }
   
    


