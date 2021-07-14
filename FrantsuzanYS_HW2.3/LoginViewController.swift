//
//  ViewController.swift
//  FrantsuzanYS_HW2.3
//
//  Created by emmisar on 13.07.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserNameTextField.delegate = self
        //PasswordTextField.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else {return}
     
       welcomeVC.userName = UserNameTextField.text

        
    }
    
    @IBAction func RememberLoginToUser(_ sender: Any) {
        let title = "Oops!"
        let message = "Your password is Password 😉"
        
        showDetails(title: title, message: message)
    }
    
    @IBAction func RememberPasswordToUser(_ sender: Any) {
        let title = "Oops!"
        let message = "Your name is User 😉"
        
        showDetails(title: title, message: message)
    }
    
   @IBAction func LogIn() {
        if UserNameTextField.text != "User" || PasswordTextField.text != "Password" {
        
            let title = "Invalid login or password"
            let message = "Please, enter correct login and password"
            
            showDetails(title: title, message: message)
        }
    }
    
   @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard segue.source is WelcomeViewController else {return}
        
        UserNameTextField.text = ""
        PasswordTextField.text = ""
    }
    
    @IBAction func tapToScreen(_ sender: Any) {
    PasswordTextField.resignFirstResponder()
   }
    
  
    //override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //super .touchesBegan(touches, with: event)
        
        //PasswordTextField.resignFirstResponder()
    //}

}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
       
        PasswordTextField.becomeFirstResponder()
        
        return true
    }
    
    func showDetails(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let alertAction = UIAlertAction(title: "OK", style: .default){_ in }
        
        alert.addAction(alertAction)
        present(alert, animated: true)
        
        }
    }
    
