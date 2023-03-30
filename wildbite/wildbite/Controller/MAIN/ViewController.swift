//
//  ViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 29.03.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

   
    @IBOutlet weak var myNavigationItem: UINavigationItem!
    @IBOutlet weak var myNavigationBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        
       
    }


    
    override func viewWillAppear(_ animated: Bool) {
        
     
        let myUserID = UserDefaults.standard.value(forKey: "userID")
        let myUserName = UserDefaults.standard.value(forKey: "userName")
        myNavigationItem.title = (myUserName as! String)
        let myUserToken = UserDefaults.standard.value(forKey: "userToken")
        print("User Id: \(myUserID!)")
        print("User Name: \(myUserName!)")
        print("User Token: \(myUserToken!)")
        
                let token = "\(myUserToken!)"
                
                let headers: HTTPHeaders = [
                
                    .authorization(bearerToken: token),
                    .accept("application/json")
                    
                ]
        
     
      
        AF.request("http://yunusgunduz.site/wildbite/public/api/user/\(myUserID!))" , headers: headers )
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { [self] response in
                
                
                switch response.result {
                case .success:
                    print("Validation Successful")
                    
                    let profileModelresponse = try? JSONDecoder().decode(ProfileModel.self, from: response.data!)
                    debugPrint(profileModelresponse!)
                    print(profileModelresponse!.user.name)
                    print("Race: \(profileModelresponse!.race.raceName)")
                    
                    switch profileModelresponse!.race.raceName{
                    case "1":
                        myNavigationItem.prompt = "\(profileModelresponse!.user.level) Level Vampir"
                   
                    case "2":
                        myNavigationItem.prompt = "\(profileModelresponse!.user.level) Level KurtAdam"
                        
                    case "3":
                        myNavigationItem.prompt = "\(profileModelresponse!.user.level) Level Avcı"
                        
                    case "99":
                        myNavigationItem.prompt = "\(profileModelresponse!.user.level) Level Admin"
                   
                        
                    default:
                        myNavigationItem.prompt = ""
                    }
                
                    
                   // self.barButtonOne.title = "asd"//"\(profileModelresponse!.user.gold)$"
                  //  barButtonTwo.title = "\(profileModelresponse!.user.currentHealth)"
                 //   barButtonThree.title = "\(profileModelresponse!.user.currentEnergy)"
                    
                 
                    
                case let .failure(error):
                    print(error.errorDescription!)
                    print("hata")
                }
            }
    }
    
    
    @IBAction func panel(_ sender: Any) {
        print("admin panel opened")
    }
    
    
}

