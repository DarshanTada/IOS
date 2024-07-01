//
//  ForgotPasswordPageViewController.swift
//  lab5
//
//  Created by Admin on 2024-06-23.
//

import UIKit

class ForgotPasswordPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    

    @IBOutlet weak var usernameTextField: UITextField!
    
    var userList : [User]?
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        usernameTextField.resignFirstResponder();
        showPassword.resignFirstResponder();
    }
    
    @IBAction func submit(_ sender: UIButton) {
        
        var checkUser = false;
        var passwordText = ""
        for user in userList! {
            if(user.username! == usernameTextField.text){
                passwordText = user.password!
                checkUser = true
                break
            }
        }
        if(checkUser){
            showPassword.text = passwordText
        }
        else {
           // Display an error message if the username is not found
           let alert = UIAlertController(title: "Error", message: "Username not found.", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(alert, animated: true, completion: nil)
       }
                    
//                 else {
//                    // Display an error message if the username is not found
//                    let alert = UIAlertController(title: "Error", message: "Username not found.", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                    present(alert, animated: true, completion: nil)
//                }
    }
    
    @IBOutlet weak var showPassword: UITextField!
    
        
        
    
}
