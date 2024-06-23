//
//  WelcomePageViewController.swift
//  lab5
//
//  Created by Admin on 2024-06-23.
//

import UIKit

class WelcomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    let users = [
           "Tom": "qwert",
           "Becky": "poiuy",
           "Sam": "zxcv",
           "James": "mnbv",
           "Sally": "98765"
       ]
    
    @IBAction func onSubmitTapped(_ sender: UIButton) {
        
        let username = usernameTextField.text ?? ""
                let password = passwordTextField.text ?? ""

        if let userPassword = users[username], userPassword == password {
                // Instantiate the UITabBarController with the identifier "homePage"
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let homePageTabBarController = storyboard.instantiateViewController(withIdentifier: "homePage") as? TabBarViewController {
                    
                    homePageTabBarController.modalPresentationStyle = .fullScreen
                    self.present(homePageTabBarController, animated: false, completion: nil)
                }
                } else {
                    let alert = UIAlertController(title: "Login Failed", message: "Invalid username or password.", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                            present(alert, animated: true, completion: nil)
                }
    }
    
    
}
