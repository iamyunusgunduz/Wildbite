//
//  ShopItemsViewController.swift
//  wildbite
//
//  Created by Yunus Gündüz on 11.05.2023.
//

import UIKit
import Alamofire

class ShopItemsViewController: UIViewController {

    var itemResimleri = [String]()
    var itemAdi = [String]()
    @IBOutlet weak var kasaName: UILabel!
   
    
    @IBOutlet weak var kasaImage: UIImageView!
    
    @IBOutlet weak var kasaAcButtonLabel: UIButton!
    @IBOutlet weak var itemGitButtonLabel: UIButton!
    var countdownSeconds = 3
       var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
       
        
        print("Shop id: \(UserDefaults.standard.integer(forKey: "ShopMenuID"))")
        print("Shop Name: \(UserDefaults.standard.string(forKey: "ShopMenuAD")!)")
        print("Shop image: \(UserDefaults.standard.string(forKey: "ShopMenuImage")!)")
        veriCek()
       
    }
    // shop id 13 kasalar
    // 1:gold 2 : diamond

  func veriCek() {
 
        let shopID = UserDefaults.standard.integer(forKey: "ShopMenuID")
        let shopAD = UserDefaults.standard.string(forKey: "ShopMenuAD")!
        let shopImage = UserDefaults.standard.string(forKey: "ShopMenuImage")!
        print("Shop id: \(UserDefaults.standard.integer(forKey: "ShopMenuID"))")
        print("Shop Name: \(UserDefaults.standard.string(forKey: "ShopMenuAD")!)")
        print("Shop image: \(UserDefaults.standard.string(forKey: "ShopMenuImage")!)")
        
        let myUserToken = UserDefaults.standard.value(forKey: "userToken")
        
        print("User Token: \(myUserToken!)")
        
        let token = "\(myUserToken!)"
        
        let headers: HTTPHeaders = [
            
            .authorization(bearerToken: token),
            .accept("application/json")
            
        ]
        AF.request("http://yunusgunduz.site/wildbite/public/api/item-shop-filter?shop=\(shopID)" , headers: headers )
            .validate(statusCode: 200..<500)
            .validate(contentType: ["application/json"])
            .responseData { [self] response in
                
                switch response.result {
                    case .success:
                        
                        let sopMenuResponse = try? JSONDecoder().decode(ItemShopFilter.self, from: response.data!)
                        //  dump(sopMenuResponse)
                        sopMenuResponse?.item.forEach({ item in
                            print(item.name)
                            print(item.image)
                            
                            itemResimleri.append(item.image)
                            itemAdi.append(item.name)
                            
                        })
                        
                        UserDefaults.standard.set(itemResimleri, forKey: "itemCekilisiItemResimleri")
                        UserDefaults.standard.set(itemAdi, forKey: "itemCekilisiItemAdi")
                       
                        print("apiden item adedi \(itemResimleri.count)")
                        var itemResimAdi = UserDefaults.standard.array(forKey: "itemCekilisiItemResimleri")
                        if(itemResimAdi?.count != nil && itemResimAdi?.count != 0) {
                            kasaAcButtonLabel.isEnabled = true
                            
                        }else{
                            kasaAcButtonLabel.isEnabled = false
                            
                        }
                      
                    case let .failure(error):
                        print(error.errorDescription!)
                        print("hata")
                    }
                    
                    
                }
            }
    
   
    func startCountdown() {
        timer = Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
  

   
  
    @objc func updateCountdown() {
        itemGitButtonLabel.isEnabled = false
        kasaAcButtonLabel.isEnabled = false
        let itemResimAdiUD = UserDefaults.standard.array(forKey: "itemCekilisiItemResimleri")
        let itemItemAdiUD = UserDefaults.standard.array(forKey: "itemCekilisiItemAdi")
        
        dump(itemResimAdiUD)
        if countdownSeconds > 0 {
            countdownSeconds -= 1
           
            if(itemResimleri.count != 0){
                let randomNumber = Int.random(in: 0 ... itemResimAdiUD!.count-1)
                print("random Number : \(randomNumber)")
                let urlImage = URL(string: "\(itemResimAdiUD![randomNumber])")
                DispatchQueue.main.async{ [self] in
                    
                      self.kasaImage.kf.setImage(with: urlImage)
                   
                      
                  }
                kasaName.text = "\(itemItemAdiUD![randomNumber])"
            }
           
            
        dump("\(countdownSeconds)")
        } else {
            timer?.invalidate()
            if(itemResimAdiUD!.count != 0){
                let randomNumber = Int.random(in: 0 ... itemResimAdiUD!.count-1)
                print("random Number : \(randomNumber)")
                let urlImage = URL(string: "\(itemResimAdiUD![randomNumber])")
                DispatchQueue.main.async{ [self] in
                    
                      self.kasaImage.kf.setImage(with: urlImage)
              
                      
                  }
                kasaName.text = "\(itemItemAdiUD![randomNumber])"
            }
            itemGitButtonLabel.isEnabled = true
            kasaAcButtonLabel.isEnabled = true
            kasaAcButtonLabel.setTitle("yeniden aç", for: .normal)
            countdownSeconds = 3
        }
    }
    @IBAction func kasaAc(_ sender: Any) {
 
        startCountdown()
    }
}
