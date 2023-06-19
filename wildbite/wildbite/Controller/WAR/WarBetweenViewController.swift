//
//  WarBetweenViewController.swift
//  wildbite
//
//  Created by Yunus Gündüz on 19.06.2023.
//

import UIKit
import Alamofire
import Kingfisher
import SwiftyGif

class WarBetweenViewController: UIViewController {
    
    var saldiranCan = 1000
    var savunanCan = 1000
    var saldiranPow = 150
    var savunanPow = 170
    var roundSayisi = 1
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var savunanCanLabel: UILabel!
    @IBOutlet weak var saldiranCanLabel: UILabel!
    @IBOutlet weak var savunanImage: UIImageView!
    @IBOutlet weak var saldiranImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background.png")!)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        roundLabel.text = "Round 1"
        saldiranCanLabel.text = "Can: \(saldiranCan)"
        savunanCanLabel.text = "Can: \(savunanCan)"
        
        do {
            let gif = try UIImage(gifName: "00bekleyis.gif")
        
            self.saldiranImage.setGifImage(gif, loopCount: -1) // Will loop forever
            self.savunanImage.setGifImage(gif, loopCount: -1) // Will loop forever
            savunanImage.transform = CGAffineTransform(scaleX: -1, y: 1)
        } catch {
            print(error)
        }
    }
    @IBAction func saldirButton(_ sender: Any) {
        do {
            let gifbekle = try UIImage(gifName: "00bekleyis.gif")
            let gifTekme = try UIImage(gifName: "00kick.gif")
            let gifSavun = try UIImage(gifName: "00savun.gif")
            savunanImage.transform = CGAffineTransform(scaleX: -1, y: 1)
            saldiranImage.transform = CGAffineTransform(translationX: 130.0, y: 0.0)
            self.saldiranImage.setGifImage(gifTekme, loopCount: 1)
            self.savunanImage.setGifImage(gifSavun, loopCount: 1)
            saldiranCan = saldiranCan - savunanPow
            savunanCan = savunanCan - saldiranPow
            saldiranCanLabel.text = "Can: \(saldiranCan)"
            savunanCanLabel.text = "Can: \(savunanCan)"
        } catch {
            print(error)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [self] in
            
            // Buraya 1 saniye sonra yapılmasını istediğiniz işlemi yazın
            
            beklemeyeGecTwoPeople ()
            
            
        }
        
        
        
    }
    func beklemeyeGecTwoPeople(){
        do {
            saldiranImage.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
            let gifbekle = try UIImage(gifName: "00bekleyis.gif")
            let kazandi = try UIImage(gifName: "Victory.gif")
            let kaybetti = try UIImage(gifName: "YouLose.gif")
            let oldu = try UIImage(gifName: "00olus.gif", levelOfIntegrity:1)
            self.saldiranImage.setGifImage(gifbekle, loopCount: 1)
            self.savunanImage.setGifImage(gifbekle, loopCount: 1)
            if(saldiranCan <= 0){
                self.savunanImage.setGifImage(kaybetti, loopCount: 1)
                self.saldiranImage.setGifImage(oldu, loopCount: 1)
                savunanImage.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            if(savunanCan <= 0){
                self.saldiranImage.setGifImage(kazandi, loopCount: 1)
                
                self.savunanImage.setGifImage(oldu, loopCount: 1)
            }
        } catch {
            print(error)
        }
        roundSayisi = roundSayisi + 1
        roundLabel.text = "Round \(roundSayisi)"
    }
    
}
extension WarBetweenViewController : SwiftyGifDelegate {

    func gifURLDidFinish(sender: UIImageView) {
        print("gifURLDidFinish")
    }

    func gifURLDidFail(sender: UIImageView) {
        print("gifURLDidFail")
    }

    func gifDidStart(sender: UIImageView) {
        print("gifDidStart")
    }
    
    func gifDidLoop(sender: UIImageView) {
        print("gifDidLoop")
    }
    
    func gifDidStop(sender: UIImageView) {
        print("gifDidStop")
    }
}
