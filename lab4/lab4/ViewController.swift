//
//  ViewController.swift
//  lab4
//
//  Created by user226510 on 6/3/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        self.textViewArea.text = "Please fill all the missing Info!"
        
        
        super.viewDidLoad()
        
        accept.isEnabled = false
        [firstNameText, surnameText, addressText, cityText, dateOfBirthText].forEach({ $0.addTarget(self, action: #selector(editingChanged), for: .editingChanged) })
    }
    
    		
    @IBAction func dismissKeyboard(_sender: UITapGestureRecognizer) {
        firstNameText.resignFirstResponder()
        surnameText.resignFirstResponder()
        addressText.resignFirstResponder()
        cityText.resignFirstResponder()
        dateOfBirthText.resignFirstResponder()
    }
    
    private func clearAllTextFields() {
        self.firstNameText.text = ""
        self.surnameText.text = ""
        self.addressText.text = ""
        self.cityText.text = ""
        self.dateOfBirthText.text = ""
        self.textViewArea.text = ""
    }
    @objc func editingChanged(_ textField: UITextField) {
           guard
               let fname = firstNameText.text, !fname.isEmpty,
    let sname = surnameText.text, !sname.isEmpty,
               let address = addressText.text, !address.isEmpty,
               let city = cityText.text, !city.isEmpty,
               let dob = dateOfBirthText.text, !dob.isEmpty
           else {
               accept.isEnabled = false
               return
           }
           
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "dd/MM/yyyy"
           
           if let date = dateFormatter.date(from: dob) {
               let age = Calendar.current.dateComponents([.year], from: date, to: Date()).year ?? 0
               print(dob.count)
               if age >= 18 && dob.count == 10 {
                   self.textViewArea.text = """
                   I, \(fname) \(sname), currently living at \(address) in the city of \(city) do hereby accept the terms and conditions assignment.

                   I am \(age) and therefore am able to accept the conditions of this assignment.
                   """
                   accept.isEnabled = true
               } else {
                   self.textViewArea.text = "Sorry, Age should be 18 or higher to accept terms."
                   accept.isEnabled = false
               }
           } else {
               self.textViewArea.text = "Please enter the birth date in dd/MM/yyyy format."
               accept.isEnabled = false
           }
       }

    
    @IBOutlet weak var firstNameText: UITextField!
    
    @IBOutlet weak var surnameText: UITextField!
    
    @IBOutlet weak var addressText: UITextField!
    
    @IBOutlet weak var cityText: UITextField!
    
    @IBOutlet weak var dateOfBirthText: UITextField!
    
    @IBOutlet weak var textViewArea: UITextView!
    
    
    @IBOutlet weak var accept: UIButton!
    
    
    
    @IBAction func resetFunction(_ sender: UIButton) {
        self.clearAllTextFields()
    }
    
    
    @IBAction func declineFunction(_ sender: UIButton) {
        self.clearAllTextFields()
                self.textViewArea.text = "Terms and Conditions  Declined!"
    }
    
    
    @IBAction func acceptFunction(_ sender: UIButton) {
        
        self.textViewArea.text = "\n\n\nTerms and Conditions Agreed Successfully!"
        
    }
    
    
    
    
    
    
    
    
    
}

