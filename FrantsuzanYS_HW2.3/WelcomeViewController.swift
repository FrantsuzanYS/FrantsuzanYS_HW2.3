//
//  WelcomeViewController.swift
//  FrantsuzanYS_HW2.3
//
//  Created by emmisar on 13.07.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var HelloLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HelloLabel.text = "Hello, " + userName
    }
    
   // @IBAction func LogOutAction() {
     //   dismiss(animated: true)
    //}
    
}
