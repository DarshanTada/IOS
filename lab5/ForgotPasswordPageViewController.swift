//
//  ForgotPasswordPageViewController.swift
//  lab5
//
//  Created by Admin on 2024-06-23.
//

import UIKit

class ForgotPasswordPageViewController: UIViewController {

    
    

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBAction func submit(_ sender: UIButton) {
        
        let username = usernameTextField.text ?? ""
                
                // Check if the username exists in the users dictionary
                if let password = users[username] {
                    // Display the password in the showPassword text field
                    showPassword.text = password
                } else {
                    // Display an error message if the username is not found
                    let alert = UIAlertController(title: "Error", message: "Username not found.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(alert, animated: true, completion: nil)
                }
    }
    
    @IBOutlet weak var showPassword: UITextField!
    
    let users = [
            "Tom": "qwert",
            "Becky": "poiuy",
            "Sam": "zxcv",
            "James": "mnbv",
            "Sally": "98765"
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
}
