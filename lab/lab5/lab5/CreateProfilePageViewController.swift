//
//  CreateProfilePageViewController.swift
//  lab5
//
//  Created by Admin on 2024-06-23.
//

import UIKit

class CreateProfilePageViewController: UIViewController {

   
    
    @IBOutlet weak var usernameText: UITextField!
    
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    @IBOutlet weak var fullNameText: UITextField!
    
    
    @IBOutlet weak var phoneNumberText: UITextField!
    
    @IBOutlet weak var feedbackText: UITextView!
    
    @IBOutlet weak var clear: UIButton!
    
    @IBOutlet weak var submit: UIButton!
    
    @IBOutlet weak var login: UIButton!
    
    // entered user details.
    var usernameValue : String?
    var passwordValue : String?
    var fullNameValue : String?
    var mobileNumberValue : String?
    var newUser : User?
    // i made model yes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        login.isEnabled = true
        feedbackText.text = "All fields in the form are mandatory."
    }
    
   
    
    
    
    @IBAction func clearFunction(_ sender: Any) {
        self.clearAllTextFields()
    }
    
    // custom function to check for only character and spaces inputs for the entered string using a regular expression.
    //reference : Google ->
    func checkForCharactersAndSpace(enteredString:String) -> Bool {
        do{
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z].*", options: [])
            if regex.firstMatch(in: enteredString, options: [], range: NSMakeRange(0, enteredString.count)) != nil {
                return false;
            }else{
                return true;
            }
        }catch {
            return false;
        }
    }

    
    
    @IBAction func submit(_ sender: UIButton) {
        if(checkMandatoryFields()){
            usernameValue = usernameText.text!
            passwordValue = passwordText.text!
            newUser = User(username: usernameValue,password: passwordValue,fullName: fullNameText.text,mobileNumber: phoneNumberText.text)
            feedbackText.text = "Registration succesfull. Login to continue"
            clear.isEnabled = false
            submit.isEnabled = false
            
//            print(usernameText.text!)
        }else{
            feedbackText.text = "All fields in the form are mandatory."
            clear.isEnabled = true
            submit.isEnabled = true
        }
    }
    
    
    
    @IBAction func fullName(_ sender: UITextField) {
        if(checkForCharactersAndSpace(enteredString: fullNameText.text!)){
            //print("OK");
            fullNameValue = fullNameText.text
        }else{
            fullNameText.text!.removeLast();
        }
    }
    
    @IBAction func phoneNumber(_ sender: UITextField) {
    }
    
    
    // tap gesture recogniser to dismiss keyboard.
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        usernameText.resignFirstResponder();
        passwordText.resignFirstResponder();
        fullNameText.resignFirstResponder();
        phoneNumberText.resignFirstResponder();
    }
   // can you hear nme?
//    i did bt i dont work smtime
    //clear values
    private func clearAllTextFields() {
        self.usernameText.text = ""
        self.passwordText.text = ""
        self.fullNameText.text = ""
        self.phoneNumberText.text = ""
        clear.isEnabled = true
        submit.isEnabled = true
        login.isHidden = true
   }
    
    //to pass new user from one view to another
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is WelcomePageViewController {
            let welcomePageViewController = segue.destination as? WelcomePageViewController
            if(newUser != nil){
//                print("userrr???");
                welcomePageViewController?.addUser(user: newUser!)
            }
        }
    }
    
    // yes, ok yeap thank you nope its all working
    // function to check if all fields are filled by the user.
    func checkMandatoryFields() -> Bool {
        if((usernameText == nil || usernameText.text == "") || (passwordText == nil || passwordText.text == "") || (fullNameText == nil || fullNameText.text == "") || (phoneNumberText == nil || phoneNumberText.text == "")){
            feedbackText.text = "All fields in the form are mandatory.";
            return false;
        }else{
            return true;
        }
    }
    
    

}
