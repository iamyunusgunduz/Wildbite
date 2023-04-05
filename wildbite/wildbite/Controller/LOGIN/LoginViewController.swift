//
//  LoginViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 4.04.2023.
//

import UIKit
import Alamofire

struct Login: Encodable {
    let email: String
    let password: String
}



class LoginViewController: UIViewController {

    
    @IBOutlet weak var mailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        userLoggined()
        
    }
   
    func userLoggined(){
        if(UserDefaults.standard.value(forKey: "userName") != nil){
            DispatchQueue.main.async(){
               self.performSegue(withIdentifier: "loginToMain", sender: self)
                print("Debug: Login To Main")
            }
       
  
        }
    }
     func userLogin() {
        
         if(mailTextField.text == "" || passwordTextField.text == "" || !mailTextField.text!.contains("@")){
             
             return
         }
         let login = Login(email: mailTextField.text!, password: passwordTextField.text!)

        AF.request("http://yunusgunduz.site/wildbite/public/api/login",
                   method: .post,
                   parameters: login,
                   encoder: JSONParameterEncoder.default)
        .validate(statusCode: 200..<300)
        .validate(contentType: ["application/json"])
        .responseData { response in
            debugPrint(response)
            
            switch response.result {
            case .success:  
                print("Login Successful")
                
                let loginResponse = try? JSONDecoder().decode(LoginModel.self, from: response.data!)
                debugPrint(loginResponse ?? "ne oldi")
                if(loginResponse?.message == nil || self.mailTextField.text == "" || self.passwordTextField.text == ""){
                    print("Debug: Message:  \(loginResponse?.message ?? "bisey oldu")")
                    return
                }
              
                
               print("Debug: endpoint response")
                print("User name: \(loginResponse!.user.name)")
                print("User Role: \(loginResponse!.user.role)")
                print("User ID: \(loginResponse!.user.id)")
                print("User email: \(loginResponse!.user.email)")
              
                UserDefaults.standard.set(loginResponse!.user.id, forKey: "userID")
                UserDefaults.standard.set(loginResponse!.token, forKey: "userToken")
                UserDefaults.standard.set(loginResponse!.user.name, forKey: "userName")
                
                let myUserID = UserDefaults.standard.value(forKey: "userID")
                let myUserName = UserDefaults.standard.value(forKey: "userName")
                let myUserToken = UserDefaults.standard.value(forKey: "userToken")
                print("Debug: userdefaults response")
                print("User Id: \(myUserID!)")
                print("User Name: \(myUserName!)")
                print("User Token: \(myUserToken!)")
                
                switch loginResponse!.user.role{
                case "0":
                    print("Debug: Banlanmis user")
                    self.performSegue(withIdentifier: "loginToMain", sender: nil)
                case "1":
                    print("Debug: Standart user")
                   
                    
                case "2":
                    print("Debug: Editor Hesabi")
                case "3":
                    print("Debug: Admin Hesabi")
                    
                default:
                    print("bilinmeyen hesap")
                    
                }
                
               
                
            case let .failure(error):
                print(error.errorDescription!)
                print("hata")
            }
        }

      
    }
    @IBAction func loginButton(_ sender: Any) {
        userLogin()
    }
    
}
