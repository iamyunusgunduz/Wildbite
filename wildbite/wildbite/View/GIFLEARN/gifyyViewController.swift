//
//  gifViewController.swift
//  wildbite
//
//  Created by Yunus Gündüz on 6.06.2023.
//

import UIKit
import SwiftyGif

class gifyyViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        do{
            let gif = try UIImage(gifName: "00.gif")
            self.profileImage.setGifImage(gif, loopCount: -1) // Will loop forever
                  }catch{
                      print(error)
                  }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
