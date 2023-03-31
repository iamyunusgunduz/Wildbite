//
//  AdminViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 31.03.2023.
//

import UIKit

class AdminViewController: UIViewController {

    @IBOutlet weak var myNavigationItem: UINavigationItem!
    @IBOutlet weak var myNavigationBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        let myUserName = UserDefaults.standard.value(forKey: "userName")
        myNavigationItem.prompt = "ADMIN: \(myUserName!)"
    }

     
}
