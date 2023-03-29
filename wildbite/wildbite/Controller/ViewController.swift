//
//  ViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 29.03.2023.
//

import UIKit
import Alamofire
struct Login: Encodable {
    let email: String
    let password: String
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
/*
        var token = ""
        
        let headers: HTTPHeaders = [
        
            .authorization(bearerToken: token),
            .accept("application/json")
            
        ]
 */
        
        let login = Login(email: "ahmet@gmail.com", password: "12345")

        AF.request("http://yunusgunduz.site/wildbite/public/api/login",
                   method: .post,
                   parameters: login,
                   encoder: JSONParameterEncoder.default
                 //  headers: headers
        
        ).response { response in
            
            let logingelencevap = try? JSONDecoder().decode(LoginModel.self, from: response.data!)
            debugPrint(logingelencevap!)
            print(logingelencevap!.user.id)
            print(logingelencevap!.user.name)
            print(logingelencevap!.user.email)
            print(logingelencevap!.user.emailVerifiedAt as Any)
            print(logingelencevap!.user.exp)
            print(logingelencevap!.user.level)
            print(logingelencevap!.user.warTotal)
            print(logingelencevap!.user.warTotalWin)
            print(logingelencevap!.user.warTotalLose)
            print(logingelencevap!.user.warTotalGold)
            print(logingelencevap!.user.gold)
            print(logingelencevap!.user.diamond)
            print(logingelencevap!.user.totalDamage)
            print(logingelencevap!.user.power)
            print(logingelencevap!.user.defense)
            print(logingelencevap!.user.speed)
            print(logingelencevap!.user.totalHunt)
            print(logingelencevap!.user.totalSuccessHunt)
            print(logingelencevap!.user.currentHealth)
            print(logingelencevap!.user.maximumHealth)
            print(logingelencevap!.user.regenerateHealthRange)
            print(logingelencevap!.user.currentEnergy)
            print(logingelencevap!.user.maximumEnergy)
            print(logingelencevap!.user.image)
            print(logingelencevap!.user.createdAt)
            print(logingelencevap!.user.updatedAt)
            print(logingelencevap!.message)
            print(logingelencevap!.token)
           
           
        }
        
        
       
    }


}

