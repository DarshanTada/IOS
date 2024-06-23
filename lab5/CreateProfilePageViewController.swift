//
//  CreateProfilePageViewController.swift
//  lab5
//
//  Created by Admin on 2024-06-23.
//

import UIKit

class CreateProfilePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var usernameText: UITextField!
    
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    @IBOutlet weak var fullNameText: UITextField!
    
    
    @IBOutlet weak var phoneNumberText: UITextField!
    
    
    @IBAction func dismissKeyboard(_sender: UITapGestureRecognizer) {
        usernameText.resignFirstResponder()
        
        passwordText.resignFirstResponder()
        fullNameText.resignFirstResponder()
        phoneNumberText.resignFirstResponder()
        
    }
    
    private func clearAllTextFields() {
        self.usernameText.text = ""
        self.passwordText.text = ""
        self.fullNameText.text = ""
        self.phoneNumberText.text = ""
   }
    
    @IBAction func clearFunction(_ sender: Any) {
        self.clearAllTextFields()
    }
    
    

}
