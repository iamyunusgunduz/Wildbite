//
//  UserProfileViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 29.03.2023.
//

import UIKit
import Alamofire

class UserProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
                let token = "6|lF1lTwKvrRKgzMzDYUM9ONk31Jog8r35E1Kbusof"
                
                let headers: HTTPHeaders = [
                
                    .authorization(bearerToken: token),
                    .accept("application/json")
                    
                ]
        
     
      
        AF.request("http://yunusgunduz.site/wildbite/public/api/user/3" , headers: headers )
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                
                
                switch response.result {
                case .success:
                    print("Validation Successful")
                    
                    let profileModelresponse = try? JSONDecoder().decode(ProfileModel.self, from: response.data!)
                    debugPrint(profileModelresponse!)
                    print(profileModelresponse!.user.name)
                    
                case let .failure(error):
                    print(error.errorDescription!)
                    print("hata")
                }
            }

    }
    

    

}
