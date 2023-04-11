//
//  ItemAddViewController.swift
//  wildbite
//
//  Created by Yunus Gunduz on 12.04.2023.
//

import UIKit

class ItemAddViewController: UIViewController {

    @IBOutlet weak var itemImageNameLabel: UILabel!
    @IBOutlet weak var itemImageNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        itemImageNameLabel.text = "Kask Image: "
        itemImageNameTextField.placeholder = "kaskname.png"
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func itemTypeChooseSegmentedControl(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
                // http://yunusgunduz.site/wildbite/image/kask/
            itemImageNameLabel.text = "Kask Image: "
            itemImageNameTextField.placeholder = "kaskname.png"
        case 1:
            // http://yunusgunduz.site/wildbite/image/kask/
            itemImageNameLabel.text = "Zırh Image: "
            itemImageNameTextField.placeholder = "Zırh.png"
            
        case 2:
                // http://yunusgunduz.site/wildbite/image/kask/
            itemImageNameLabel.text = "Sılah Image: "
            itemImageNameTextField.placeholder = "Sılah.png"
            
        case 3:
                // http://yunusgunduz.site/wildbite/image/kask/
            itemImageNameLabel.text = "Kalkan Image: "
            itemImageNameTextField.placeholder = "Kalkan.png"
            
        case 4:
                // http://yunusgunduz.site/wildbite/image/kask/
            itemImageNameLabel.text = "Kolye Image: "
            itemImageNameTextField.placeholder = "Kolye.png"
            
        case 5:
                // http://yunusgunduz.site/wildbite/image/kask/
            itemImageNameLabel.text = "Eldıven Image: "
            itemImageNameTextField.placeholder = "Eldıven.png"
            
        case 6:
                // http://yunusgunduz.site/wildbite/image/kask/
            itemImageNameLabel.text = "Bot Image: "
            itemImageNameTextField.placeholder = "Bot.png"
            
        case 7:
                // http://yunusgunduz.site/wildbite/image/kask/
            itemImageNameLabel.text = "Iksır Image: "
            itemImageNameTextField.placeholder = "Iksır.png"
            
            
        default:
           break
        }
    }
    
    
}
