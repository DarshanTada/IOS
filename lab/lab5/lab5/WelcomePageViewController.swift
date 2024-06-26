//
//  WelcomePageViewController.swift
//  lab5
//
//  Created by Admin on 2024-06-23.
//

import UIKit

class WelcomePageViewController: UIViewController {

    var logout = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if(logout == "yes"){
            usernameTextField.text = ""
            passwordTextField.text = ""
        }
        let tom = User(username: "Tom", password: "qwert");
        let becky = User(username: "Becky", password: "poiuy");
        let sam = User(username: "Sam", password: "zxcv");
        let james = User(username: "James", password: "mnbv");
        let sally = User(username: "Sally", password: "98765");
        addUser(user: tom);
        addUser(user: becky);
        addUser(user: sam);
        addUser(user: james);
        addUser(user: sally);
    }
    
    // Array of all regiseterd users.
    var usersList : [User] = []
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //funciton to add new user.
    func addUser(user : User){
        let newUser = User(username: user.username,password: user.password,fullName: user.fullName, mobileNumber: user.mobileNumber)
        usersList.append(newUser)
    }
    
    
    // pass the user list to the forgot password view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ForgotPasswordPageViewController {
        let forgotPasswordPageViewController = segue.destination as? ForgotPasswordPageViewController
            forgotPasswordPageViewController?.userList = usersList
        }
    }

    
    @IBAction func onSubmitTapped(_ sender: UIButton) {
        
        // check and allow user to login only if the username and password entered are verified.
        var validateUser = false;
        for user in usersList {
            if(user.username! == usernameTextField.text && user.password == passwordTextField.text){
                validateUser = true
                break
            }
        }
        if(validateUser){
        
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let homePageTabBarController = storyboard.instantiateViewController(withIdentifier: "homePage") as? TabBarViewController {

                homePageTabBarController.modalPresentationStyle = .fullScreen
                self.present(homePageTabBarController, animated: false, completion: nil)
            }
            
//            performSegue(withIdentifier: "homePage", sender: onSubmitTapped)
        }else{
              let alert = UIAlertController(title: "Login Failed", message: "Invalid username or password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
}
