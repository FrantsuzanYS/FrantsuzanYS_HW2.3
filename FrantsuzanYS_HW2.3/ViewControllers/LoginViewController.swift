//
//  ViewController.swift
//  FrantsuzanYS_HW2.3
//
//  Created by emmisar on 13.07.2021.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Private properties
    private let user = ""
    private let password = ""
    
    // MARK: - Navigation
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil
                , queue: nil) { (nc) in
                    self.view.frame.origin.y = -100
                }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil
                , queue: nil) { (nc) in
                    self.view.frame.origin.y = 0
                }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       //guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        //welcomeVC.userName = User.getUserInfo().person
        
       let tabBarController = segue.destination as! UITabBarController
        if let viewControllers = tabBarController.viewControllers {
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = User.getUserInfo().person.name
            } else if let personalInfoVC = viewController as? PersonalInfoVC {
                personalInfoVC.photo = User.getUserInfo().photo
                //personalInfoVC.userPerson = User.getUserInfo().person
            }
        }
       }
    }
   
    // MARK: - IBActions
    @IBAction func RememberDataToUser(_ sender: UIButton) {
        sender.tag == 0
            ? showDetails(title: "Oops!", message: "Your name is \(user) 😉")
            : showDetails(title: "Oops!", message: "Your password is \(password) 😉")
    }
    
   @IBAction func LogIn() {
        if userNameTextField.text != user || passwordTextField.text != password {
            let title = "Invalid login or password"
            let message = "Please, enter correct login and password"
            
            showDetails(title: title, message: message)
            
            passwordTextField.text = ""
        } else {
            return
        }
    }
    
   @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else {return}
        
        userNameTextField.text = ""
        passwordTextField.text = ""
    }

}

// MARK: - Private Methods
extension LoginViewController {
    
    private func showDetails(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let alertAction = UIAlertAction(title: "OK", style: .default){_ in }
        
        alert.addAction(alertAction)
        present(alert, animated: true)
        
        }
}

// MARK: - Work whith keyboard
extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)

        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        if textField == passwordTextField {
            LogIn()
        } else {
            passwordTextField.becomeFirstResponder()
        }
        return true
    }

}
    
