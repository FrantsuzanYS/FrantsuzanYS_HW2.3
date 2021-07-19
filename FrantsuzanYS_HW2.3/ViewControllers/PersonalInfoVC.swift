//
//  PersonalInfoVC.swift
//  FrantsuzanYS_HW2.3
//
//  Created by emmisar on 19.07.2021.
//

import UIKit

class PersonalInfoVC: UIViewController {

    @IBOutlet weak var myPhotoImageView: UIImageView!
    var photo = ""
    //var userPerson: Person
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPhotoImageView.image = UIImage(named: photo)
    }
}
